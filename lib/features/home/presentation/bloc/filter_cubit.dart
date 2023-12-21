import 'package:flutter_bloc/flutter_bloc.dart';

class FilterCubit extends Cubit<String> {
  FilterCubit() : super('All'); // Initialize with a default value

  void filter(String sortBy) {
    emit(sortBy); // Toggle the current state
  }
}
