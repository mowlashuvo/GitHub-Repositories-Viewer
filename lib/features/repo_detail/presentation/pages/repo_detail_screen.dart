import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../home/domain/entities/git_repo_entity.dart';

class RepoDetailScreen extends StatelessWidget {
  const RepoDetailScreen({super.key, required this.data});

  final GitRepoDataEntity data;
  static const String routeName = '/detail';

  static Route route({required GitRepoDataEntity data}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => RepoDetailScreen(data: data),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back,
              color: Color.fromRGBO(28, 28, 30, 0.54)),
        ),
        title: Text(
          'Repository Details',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 5,
              margin: EdgeInsets.zero,
              clipBehavior: Clip.antiAlias,
              child: CachedNetworkImage(
                imageUrl: data.owner!.avatarUrl!,
                width: double.infinity,
                fit: BoxFit.fill,
                placeholder: (context, url) => CircularProgressIndicator(
                  color: Theme.of(context).indicatorColor,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            SizedBox(height: 16.h,),
            Text(
              DateFormatter.formatDateTime(data.updatedAt!),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall,
            ),
            SizedBox(height: 16.h,),
            Text(
              data.owner!.login.toString(),
              style: Theme.of(context)
                  .textTheme
                  .titleSmall,
            ),
            SizedBox(height: 8.h,),
            Text(
              data.description.toString(),
              style: Theme.of(context)
                  .textTheme
                  .titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
