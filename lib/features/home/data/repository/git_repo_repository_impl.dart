import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/git_repo_entity.dart';
import '../../domain/repository/git_repo_repository.dart';
import '../data_sources/local/git_repo_local_data_source.dart';
import '../data_sources/remote/git_repo_remote_data_source.dart';

class GitRepoRepositoryImpl implements GitRepoRepository {
  final GitRepoRemoteDataSource _remoteDataSource;
  final GitRepoLocalDataSource _localDataSource;

  const GitRepoRepositoryImpl(
      {required GitRepoRemoteDataSource remoteDataSource,
      required GitRepoLocalDataSource localDataSource})
      : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  @override
  Future<Either<Failure, GitRepoEntity>> getGitRepoFromRemote({required int page}) async {
    try {
      final result = await _remoteDataSource.getGitRepo(page: page);
      return Right(result.toEntity());
    } on ServerException {
      final result = await _localDataSource.getGitRepoFromLocal();
      return Right(result.toEntity());
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, GitRepoEntity>> getGitRepoFromLocal() async {
    try {
      var result = await _localDataSource.getGitRepoFromLocal();

      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
