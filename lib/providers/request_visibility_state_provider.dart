import 'package:first_project/enums/request_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final requestVisibilityStateProvider = StateProvider<RequestVisibility>((ref) => RequestVisibility.everyone);
