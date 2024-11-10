import 'package:first_project/enums/leave_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final leaveTypeStateProvider = StateProvider<LeaveType>((ref) => LeaveType.parental);
