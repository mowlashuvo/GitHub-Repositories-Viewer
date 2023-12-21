import 'package:flutter/material.dart';

import '../../features/home/domain/entities/git_repo_entity.dart';
import '../../features/home/presentation/pages/home_screen.dart';
import '../../features/repo_detail/presentation/pages/repo_detail_screen.dart';
import '../../splash/splash_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return HomeScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case RepoDetailScreen.routeName:
        return RepoDetailScreen.route(data: settings.arguments as GitRepoDataEntity);
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
      ),
    );
  }
}
