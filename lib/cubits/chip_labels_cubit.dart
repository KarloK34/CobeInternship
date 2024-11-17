import 'package:flutter_bloc/flutter_bloc.dart';

class ChipLabelsCubit extends Cubit<List<String>> {
  ChipLabelsCubit() : super([
    'Offline',
    'Online',
    'Parental',
    'Sick',
    'Vacation',
  ]);
}
