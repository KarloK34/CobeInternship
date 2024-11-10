import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateMapStateProvider = StateProvider<Map<String, DateTime?>>((ref) {
  return {
    'start': null,
    'end': null,
  };
});
