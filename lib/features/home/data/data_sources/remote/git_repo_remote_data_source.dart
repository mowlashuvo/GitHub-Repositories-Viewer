import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/error/exception.dart';
import '../../models/git_repo_model.dart';

abstract class GitRepoRemoteDataSource {
  Future<GitRepoModel> getGitRepo({required int page});
}

class GitRepoRemoteDataSourceImpl implements GitRepoRemoteDataSource {
  @override
  Future<GitRepoModel> getGitRepo({required int page}) async {
    String url = '${Constants.baseUrl}/search/repositories?q=flutter&per_page=10&page=$page';

    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    if (kDebugMode) {
      print(url);
      print(response.body);
      print(response.statusCode);
    }
    if (response.statusCode == 200) {
      return GitRepoModel.fromRawJson(response.body);
    } else {
      throw ServerException();
    }
  }


}