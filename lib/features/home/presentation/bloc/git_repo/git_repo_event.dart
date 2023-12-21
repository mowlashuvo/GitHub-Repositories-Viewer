part of 'git_repo_bloc.dart';

abstract class GitRepoEvent extends Equatable {
  const GitRepoEvent();

  @override
  List<Object?> get props => [];
}

class GitRepoLoadingEvent extends GitRepoEvent {}

class GitRepoLoadEvent extends GitRepoEvent {}

class GitRepoFetchEvent extends GitRepoEvent {}

class NewGitRepoLoadEvent extends GitRepoEvent {}

class GitRepoSortEvent extends GitRepoEvent {
  final List<GitRepoDataEntity> products;

  const GitRepoSortEvent(this.products);

  @override
  List<Object?> get props => [products];
}