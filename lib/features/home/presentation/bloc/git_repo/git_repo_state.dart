part of 'git_repo_bloc.dart';

abstract class GitRepoState extends Equatable {
  const GitRepoState();

  @override
  List<Object?> get props => [];
}

class GitRepoInitialState extends GitRepoState {
  const GitRepoInitialState();
}

class GitRepoLoadingState extends GitRepoState {
  final String? message;

  const GitRepoLoadingState({this.message});

  @override
  List<Object?> get props => [message,];
}

class GitRepoSortState extends GitRepoState {
  final List<GitRepoDataEntity> products;

  const GitRepoSortState({
    required this.products,
  });
  @override
  List<Object?> get props => [products];
}

class GitRepoSuccessState extends GitRepoState {
  final List<GitRepoDataEntity> products;

  const GitRepoSuccessState({
    required this.products,
  });
  @override
  List<Object?> get props => [products];
}

class GitRepoErrorState extends GitRepoState {
  final String error;

  const GitRepoErrorState({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}
