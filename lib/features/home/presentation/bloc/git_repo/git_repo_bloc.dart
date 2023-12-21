import 'dart:async';

import 'package:bs23fluttertask/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/git_repo_entity.dart';
import '../../../domain/usecases/git_repo_use_case.dart';

part 'git_repo_event.dart';

part 'git_repo_state.dart';

class GitRepoBloc extends Bloc<GitRepoEvent, GitRepoState> {
  final GitRepoUseCase _useCase;

  GitRepoBloc({
    required GitRepoUseCase useCase,
  })  : _useCase = useCase,
        super(const GitRepoInitialState()) {
    on<GitRepoLoadEvent>(_onLoadGitRepo);
    on<GitRepoFetchEvent>(_onFetchGitRepo);
    on<GitRepoSortEvent>(_onSortGitRepo);
    on<NewGitRepoLoadEvent>(_onLoadNewGitRepo);
  }

  int page = 1;
  int totalPage = 100;
  bool isFetching = false;

  Future<void> _onLoadGitRepo(
    GitRepoLoadEvent event,
    Emitter<GitRepoState> emit,
  ) async {
    emit(const GitRepoLoadingState(message: 'Loading Git Repo'));
    final result = await _useCase.local();
    result.fold((failure) {
      // remote call
      print('remote call');
      add(GitRepoFetchEvent());
    }, (data) {
      int totalCount = data.items!.length;
      page = (totalCount/10).round()+1;
      print('page $page');
      emit(GitRepoSuccessState(products: data.items!));
    });
  }

  Future<void> _onFetchGitRepo(
    GitRepoFetchEvent event,
    Emitter<GitRepoState> emit,
  ) async {
    final Either<Failure, GitRepoEntity> result;
    if (page <= totalPage) {
      // emit(const GitRepoLoadingState(message: 'Loading Git Repo'));
      result = await _useCase.remote(page: page);
      result.fold((failure) {
        emit(GitRepoErrorState(error: failure.message));
      }, (data) {
        emit(GitRepoSuccessState(products: data.items!));
        isFetching = false;
        page++;
      });
    }
  }

  Future<void> _onSortGitRepo(
      GitRepoSortEvent event,
    Emitter<GitRepoState> emit,
  ) async {
    print('sort');
    emit(GitRepoSortState(products: event.products));
  }

  Future<void> _onLoadNewGitRepo(
    NewGitRepoLoadEvent event,
    Emitter<GitRepoState> emit,
  ) async {
    emit(const GitRepoLoadingState(message: 'Loading Git Repo'));
    final result = await _useCase.remote(page: 1);
    result.fold((failure) {
      emit(GitRepoErrorState(error: failure.message));
    }, (data) {
      emit(GitRepoSuccessState(products: data.items!));
    });
  }
}
