import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/git_repo_entity.dart';

abstract class GitRepoRepository {
  Future <Either<Failure, GitRepoEntity>> getGitRepoFromRemote({required int page});
  Future <Either<Failure, GitRepoEntity>> getGitRepoFromLocal();
}