import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedFiltersCubit extends Cubit<Set<String>> {
  SelectedFiltersCubit() : super({});

  void toggleFilter(String filter) {
    if (state.contains(filter)) {
      emit({...state}..remove(filter));
    } else {
      emit({...state}..add(filter));
    }
  }

  bool containsFilter(String filter) {
    return state.contains(filter);
  }
}
