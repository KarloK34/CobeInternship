import 'package:flutter_bloc/flutter_bloc.dart';

class SearchQueryCubit extends Cubit<String> {
  SearchQueryCubit() : super('');

  void updateSearchQuery(String query) {
    emit(query.trim());
  }
}
