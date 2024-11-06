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
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(LeaveRequestAdapter());
  Hive.registerAdapter(LeaveTypeAdapter());
  Hive.registerAdapter(RequestVisibilityAdapter());
  Hive.registerAdapter(LeaveRequestStatusAdapter());
  Hive.registerAdapter(RoleAdapter());
  Hive.registerAdapter(ConnectionStatusAdapter());
  await Hive.openBox<User>('userBox');
  await Hive.openBox<LeaveRequest>('requestBox');
  createUsers();
  createRequests();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: SplashScreen.routeName,
      onGenerateRoute: generateRoute,
    );
  }
}

List<User> createUsers() {
  var userBox = Hive.box<User>('userBox');

  if (userBox.isEmpty) {
    final users = [
      User(1, 'Karlo', 'Kraml', Role.Student, AppImages.dummyProfile, ConnectionStatus.Online),
      User(2, 'Stela', 'Kraml', Role.Student, AppImages.dummyProfile, ConnectionStatus.Online)
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
  User Stela = userBox.values.last;

  Map<User, EmailAndPassword> userCredentials = {
    Karlo: EmailAndPassword('karlo.kraml@gmail.com', 'karlo123'),
    Stela: EmailAndPassword('stela.vlasic@gmail.com', 'stela123'),
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
      LeaveRequest(user1.id, DateTime(2024, 11, 20), DateTime(2024, 11, 27), LeaveType.Sick, RequestVisibility.everyone, "Flu", LeaveRequestStatus.Pending),
      LeaveRequest(user2.id, DateTime(2024, 11, 20), DateTime(2024, 11, 27), LeaveType.Sick, RequestVisibility.everyone, "Flu", LeaveRequestStatus.Pending),
    ];

    for (var request in requests) {
      requestBox.add(request);
    }
  }
}
