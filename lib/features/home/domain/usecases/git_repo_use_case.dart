import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/git_repo_entity.dart';
import '../repository/git_repo_repository.dart';

class GitRepoUseCase {
  final GitRepoRepository _repository;

  const GitRepoUseCase({required GitRepoRepository repository})
      : _repository = repository;

  Future<Either<Failure, GitRepoEntity>> remote({required int page}) {
    return _repository.getGitRepoFromRemote(page: page);
  }

  Future<Either<Failure, GitRepoEntity>> local() {
    return _repository.getGitRepoFromLocal();
  }
}
