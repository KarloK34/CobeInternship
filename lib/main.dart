import 'package:first_project/cubits/all_requests_cubit.dart';
import 'package:first_project/cubits/all_users_cubit.dart';
import 'package:first_project/cubits/approved_request_cubit.dart';
import 'package:first_project/cubits/fab_cubit.dart';
import 'package:first_project/cubits/pending_request_cubit.dart';
import 'package:first_project/get_it/get_it.dart';
import 'package:first_project/hive/hive_adapters/connection_status_adapter.dart';
import 'package:first_project/hive/hive_adapters/leave_request_status_adapter.dart';
import 'package:first_project/hive/hive_adapters/leave_type_adapter.dart';
import 'package:first_project/hive/hive_adapters/request_visibility_adapter.dart';
import 'package:first_project/hive/hive_adapters/role_adapter.dart';
import 'package:first_project/hive/hive_boxes.dart';
import 'package:first_project/models/auth_data.dart';
import 'package:first_project/models/date.dart';
import 'package:first_project/models/date_range.dart';
import 'package:first_project/models/leave_request.dart';
import 'package:first_project/models/token.dart';
import 'package:first_project/models/user.dart';
import 'package:first_project/repositories/leave_request_repository.dart';
import 'package:first_project/routes/app_routes.dart';
import 'package:first_project/screens/splash_screen.dart';
import 'package:first_project/utilities/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

final authData = <String, AuthData>{
  'id1': AuthData(email: 'davorstajcertehnicka@gmail.com', password: 'daca1234'),
  'id2': AuthData(email: 'danijel@gmail.com', password: 'danijel1234'),
  'id3': AuthData(email: 'iamkarlo@gmail.com', password: 'karlo1234'),
  'id4': AuthData(email: 'thedamir@gmail.com', password: 'damir1234'),
  'id5': AuthData(email: 'thebitch@gmail.com', password: 'bitch1234'),
  'id6': AuthData(email: 'thepregnant@gmail.com', password: 'pregnant1234'),
};

void registerHiveAdapters() {
  Hive.registerAdapter(LeaveTypeAdapter());
  Hive.registerAdapter(RequestVisibilityAdapter());
  Hive.registerAdapter(LeaveRequestStatusAdapter());
  Hive.registerAdapter(RoleAdapter());
  Hive.registerAdapter(ConnectionStatusAdapter());
  Hive.registerAdapter(DateRangeAdapter());
  Hive.registerAdapter(DateAdapter());
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(LeaveRequestAdapter());
  Hive.registerAdapter(TokenAdapter());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  registerHiveAdapters();
  await HiveBoxes.init();
  configureDependencies();
  getIt<AllUsersCubit>().loadUsers();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FabCubit()),
        BlocProvider(create: (context) => AllRequestsCubit(getIt<LeaveRequestRepository>())..loadRequests()),
        BlocProvider(create: (context) => ApprovedRequestCubit(context.read<AllRequestsCubit>())),
        BlocProvider(create: (context) => PendingRequestCubit(context.read<AllRequestsCubit>())),
      ],
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        initialRoute: SplashScreen.routeName,
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
