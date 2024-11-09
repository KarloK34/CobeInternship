import 'package:flutter_riverpod/flutter_riverpod.dart';

final chipLabelsProvider = Provider((ref) {
  const List<String> chipLabels = [
    'Offline',
    'Online',
    'Parental',
    'Sick',
    'Vacation',
  ];
  return chipLabels;
});
