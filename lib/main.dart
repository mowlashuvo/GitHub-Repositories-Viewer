import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/bloc/simple_bloc_observer.dart';
import 'core/config/app_router.dart';
import 'core/config/theme.dart';
import 'features/home/data/data_sources/local/git_repo_local_data_source.dart';
import 'features/home/data/data_sources/remote/git_repo_remote_data_source.dart';
import 'features/home/data/repository/git_repo_repository_impl.dart';
import 'features/home/domain/usecases/git_repo_use_case.dart';
import 'features/home/presentation/bloc/filter_cubit.dart';
import 'features/home/presentation/bloc/git_repo/git_repo_bloc.dart';
import 'splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load(fileName: "assets/.env");
  SystemChannels.textInput.invokeMethod('TextInput.hide');
  Bloc.observer = SimpleBlocObserver();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GitRepoBloc>(
          create: (context) => GitRepoBloc(
            useCase: GitRepoUseCase(
              repository: GitRepoRepositoryImpl(
                remoteDataSource: GitRepoRemoteDataSourceImpl(),
                localDataSource: GitRepoLocalDataSourceImpl()
              ),
            ),
          ),
        ),
        BlocProvider<FilterCubit>(
          create: (context) => FilterCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 844),
        builder: (context, child) => MaterialApp(
          title: 'GitHub Gist',
          theme: theme(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: SplashScreen.routeName,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
