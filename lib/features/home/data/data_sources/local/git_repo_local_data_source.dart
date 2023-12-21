import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/error/exception.dart';
import '../../models/git_repo_model.dart';
import '../remote/git_repo_remote_data_source.dart';

abstract class GitRepoLocalDataSource {
  Future<GitRepoModel> getGitRepoFromLocal();
}

class GitRepoLocalDataSourceImpl implements GitRepoLocalDataSource {
  @override
  Future<GitRepoModel> getGitRepoFromLocal() async {
    return retrieveUserData();
  }

  Future<GitRepoModel> retrieveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve JSON data from SharedPreferences
    String? jsonString = prefs.getString('git_repo');

    // Deserialize JSON string to UserData object
    if (jsonString != null) {
      return GitRepoModel.fromRawJson(jsonString);
    } else {
      throw ServerException();
    }
  }

}