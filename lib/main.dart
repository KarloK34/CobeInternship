import 'package:first_project/cubits/all_requests_cubit.dart';
import 'package:first_project/cubits/all_users_cubit.dart';
import 'package:first_project/cubits/approved_request_cubit.dart';
import 'package:first_project/cubits/create_request_cubit.dart';
import 'package:first_project/cubits/fab_cubit.dart';
import 'package:first_project/cubits/form_state_cubit.dart';
import 'package:first_project/cubits/pending_request_cubit.dart';
import 'package:first_project/cubits/user_cubit.dart';
import 'package:first_project/enums/connection_status.dart';
import 'package:first_project/enums/leave_request_status.dart';
import 'package:first_project/enums/leave_type.dart';
import 'package:first_project/enums/request_visibility.dart';
import 'package:first_project/enums/role.dart';
import 'package:first_project/hive_adapters/connection_status_adapter.dart';
import 'package:first_project/hive_adapters/leave_request_status_adapter.dart';
import 'package:first_project/hive_adapters/leave_type_adapter.dart';
import 'package:first_project/hive_adapters/request_visibility_adapter.dart';
import 'package:first_project/hive_adapters/role_adapter.dart';
import 'package:first_project/models/email_and_password.dart';
import 'package:first_project/models/leave_request.dart';
import 'package:first_project/models/user.dart';
import 'package:first_project/routes/app_routes.dart';
import 'package:first_project/screens/splash_screen.dart';
import 'package:first_project/utilities/app_images.dart';
import 'package:first_project/utilities/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

final getIt = GetIt.instance;

void registerHiveAdapters() {
  Hive.registerAdapter(LeaveTypeAdapter());
  Hive.registerAdapter(RequestVisibilityAdapter());
  Hive.registerAdapter(LeaveRequestStatusAdapter());
  Hive.registerAdapter(RoleAdapter());
  Hive.registerAdapter(ConnectionStatusAdapter());
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(LeaveRequestAdapter());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  registerHiveAdapters();
  await Hive.deleteBoxFromDisk('requestBox');
  await Hive.deleteBoxFromDisk('userBox');
  final userBox = await Hive.openBox<User>('userBox');
  final requestBox = await Hive.openBox<LeaveRequest>('requestBox');
  await userBox.clear();
  await requestBox.clear();
  createUsers();
  createRequests();
  getIt.registerSingleton<UserCubit>(UserCubit());
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<UserCubit>()),
        BlocProvider(create: (context) => FabCubit()),
        BlocProvider(create: (context) => AllUsersCubit()..loadUsers()),
        BlocProvider(create: (context) => AllRequestsCubit()..loadRequests()),
        BlocProvider(create: (context) => ApprovedRequestCubit(context.read<AllRequestsCubit>())),
        BlocProvider(create: (context) => PendingRequestCubit(context.read<AllRequestsCubit>())),
        BlocProvider(create: (context) => FormStateCubit()),
        BlocProvider(
          create: (context) => CreateRequestCubit(
            context.read<FormStateCubit>(),
            context.read<AllRequestsCubit>(),
            context.read<PendingRequestCubit>(),
          ),
        ),
      ],
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        initialRoute: SplashScreen.routeName,
        onGenerateRoute: generateRoute,
      ),
    );
  }
}

List<User> createUsers() {
  var userBox = Hive.box<User>('userBox');

  if (userBox.isEmpty) {
    final users = [
      User(1, 'Karlo', 'Kraml', Role.student, AppImages.dummyProfile, ConnectionStatus.online, true),
      User(2, 'Stela', 'Kraml', Role.student, AppImages.dummyProfile2, ConnectionStatus.offline),
      User(3, 'Davor', 'Štajcer', Role.employee, AppImages.dummyProfile, ConnectionStatus.offline),
    ];

    for (var user in users) {
      userBox.add(user);
    }
  }

  return userBox.values.toList();
}

Map<User, EmailAndPassword> createUserCredentials() {
  var userBox = Hive.box<User>('userBox');
  User Karlo = userBox.values.first;
  User Stela = userBox.values.elementAt(1);
  User Davor = userBox.values.elementAt(2);

  Map<User, EmailAndPassword> userCredentials = {
    Karlo: EmailAndPassword('karlo.kraml@gmail.com', 'karlo123'),
    Stela: EmailAndPassword('stela.vlasic@gmail.com', 'stela123'),
    Davor: EmailAndPassword('davor.stajcer@gmail.com', 'davor123'),
  };

  return userCredentials;
}

void createRequests() {
  var requestBox = Hive.box<LeaveRequest>('requestBox');
  var userBox = Hive.box<User>('userBox');

  if (requestBox.isEmpty) {
    User user1 = userBox.values.first;
    User user2 = userBox.values.last;

    final requests = [
      LeaveRequest(user1.id, DateTime(2024, 11, 20), DateTime(2024, 11, 27), LeaveType.sick, RequestVisibility.everyone, "Flu", LeaveRequestStatus.pending),
      LeaveRequest(user1.id, DateTime(2024, 11, 20), DateTime(2024, 11, 27), LeaveType.sick, RequestVisibility.everyone, "Flu", LeaveRequestStatus.pending),
      LeaveRequest(user1.id, DateTime(2024, 11, 20), DateTime(2024, 11, 27), LeaveType.sick, RequestVisibility.everyone, "Flu", LeaveRequestStatus.pending),
      LeaveRequest(
          user2.id, DateTime(2024, 11, 20), DateTime(2024, 11, 27), LeaveType.vacation, RequestVisibility.everyone, "Vienna", LeaveRequestStatus.pending),
    ];

    for (var request in requests) {
      requestBox.add(request);
    }
  }
}
