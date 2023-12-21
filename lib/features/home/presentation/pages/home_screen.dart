import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/config/color_constants.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../repo_detail/presentation/pages/repo_detail_screen.dart';
import '../../data/models/git_repo_model.dart';
import '../../domain/entities/git_repo_entity.dart';
import '../bloc/filter_cubit.dart';
import '../bloc/git_repo/git_repo_bloc.dart';
import '../widgets/error_state_view.dart';
import '../widgets/loading_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  static const String routeName = '/home';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Timer _timer;
  List<GitRepoDataEntity> items = [];
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    items.clear();
    context.read<GitRepoBloc>().add(GitRepoLoadEvent());
    // Set up a periodic timer to call _updateCounter every 1 second
    _timer = Timer.periodic(const Duration(minutes: 30), (timer) {
      _updateCounter();
    });
  }

  void _updateCounter() {
    items.clear();
    context.read<GitRepoBloc>().add(NewGitRepoLoadEvent());
  }

  @override
  void dispose() {
    // Cancel the timer to avoid memory leaks
    _timer.cancel();
    super.dispose();
  }

  Future<void> storeGitRepo(List<GitRepoDataEntity> gitRepoDataEntity) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Convert Data to JSON string
    GitRepoModel gitRepoModel =
        GitRepoEntity(incompleteResults: false, items: gitRepoDataEntity)
            .toModel();

    // clear sharedpreferences
    prefs.remove('git_repo');
    // Store JSON data in SharedPreferences
    prefs.setString('git_repo', gitRepoModel.toRawJson());
  }

  void sortByDate() {
    List<GitRepoDataEntity> gitRepo = [];
    gitRepo.addAll(items);
    gitRepo.sort((a, b) => b.updatedAt!.compareTo(a.updatedAt!));
    context.read<GitRepoBloc>().add(GitRepoSortEvent(gitRepo));
  }

  void sortByFork() {
    List<GitRepoDataEntity> gitRepo = [];
    gitRepo.addAll(items);
    gitRepo.sort((a, b) => b.forks!.compareTo(a.forks!));
    context.read<GitRepoBloc>().add(GitRepoSortEvent(gitRepo));
  }

  String selectedFilter = 'Sort By Date'; // Initial selected filter

  List<String> filters = ['Sort By Date', 'Sort By Fork'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(toolbarHeight: 80.h),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<GitRepoBloc>().add(GitRepoLoadEvent());
        },
        child: BlocConsumer<FilterCubit, String>(
          listener: (context, sort) {
            if (sort == filters[0]) {
              sortByDate();
            } else {
              sortByFork();
            }
          },
          builder: (context, sort) {
            return Column(
              children: [
                Container(
                  // height: 40.h,
                  margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  padding: EdgeInsets.only(left: 16.w, right: 8.w),
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 0.50.w,
                        color: sort != 'All'
                            ? ColorConstants.primaryColor
                            : ColorConstants.textColor,
                      ),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: PopupMenuButton<String>(
                    itemBuilder: (context) {
                      return filters.map((str) {
                        return PopupMenuItem(
                          value: str,
                          child: Text(
                            str,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        );
                      }).toList();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        // left: 10.w,
                        // right: 10.w,
                        top: 7.h,
                        bottom: 7.h,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              sort,
                              softWrap: false,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: sort != 'All'
                                  ? Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Theme.of(context).primaryColor)
                                  : Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Icon(
                            Icons.arrow_drop_down,
                            size: 30.sp,
                            color: Theme.of(context).primaryColor,
                          ),
                        ],
                      ),
                    ),
                    onSelected: (sort) {
                      context.read<FilterCubit>().filter(sort);
                    },
                  ),
                ),
                SizedBox(height: 8.h,),
                Expanded(
                  child: BlocConsumer<GitRepoBloc, GitRepoState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is GitRepoLoadingState) {
                        return const LoadingWidget();
                      } else if (state is GitRepoSuccessState) {
                        items.addAll(state.products);
                        storeGitRepo(items);
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      } else if (state is GitRepoSortState) {
                        items.clear();
                        items.addAll(state.products);
                        print('state.products ${items}');
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      } else if (state is GitRepoErrorState &&
                          items.isEmpty) {
                        return ErrorStateView(
                          message: state.error,
                          onRefresh: () {
                            context.read<GitRepoBloc>().add(GitRepoLoadEvent());
                          },
                        );
                      }
                      if (items.isNotEmpty) {
                        return GridView.builder(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.0.w,
                            // vertical: 10.0.h,
                          ),
                          itemCount: items.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8.0.w,
                              mainAxisSpacing: 8.0.h,
                              childAspectRatio: (.90)),
                          controller: scrollController
                            ..addListener(() {
                              if (scrollController.offset ==
                                  scrollController.position.maxScrollExtent &&
                                  !BlocProvider.of<GitRepoBloc>(context)
                                      .isFetching) {
                                BlocProvider.of<GitRepoBloc>(context)
                                  ..isFetching = true
                                  ..add(GitRepoFetchEvent());
                              }
                            }),
                          itemBuilder: (context, index) {
                            final product = items[index];
                            return Card(
                              elevation: 0,
                              margin: EdgeInsets.zero,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0.r),
                              ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, RepoDetailScreen.routeName, arguments: product);
                                },
                                customBorder: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0.r),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.w, vertical: 8.h),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.name.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                      Text(
                                        'Fork: ${product.forksCount}',
                                        style:
                                        Theme.of(context).textTheme.bodySmall,
                                      ),
                                      Text(
                                        'Date: ${DateFormatter.formatDateTime(product.updatedAt!)}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          // separatorBuilder: (context, index) {
                          //   return SizedBox(
                          //     height: 10.h,
                          //   );
                          // },
                        );
                      } else {
                        return const Center();
                      }
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
