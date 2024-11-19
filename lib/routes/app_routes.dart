import 'package:first_project/cubits/all_requests_cubit.dart';
import 'package:first_project/cubits/create_request_cubit.dart';
import 'package:first_project/cubits/form_state_cubit.dart';
import 'package:first_project/cubits/pending_request_cubit.dart';
import 'package:first_project/cubits/update_request_status_cubit.dart';
import 'package:first_project/models/user.dart';
import 'package:first_project/screens/approved_requests_screen.dart';
import 'package:first_project/screens/create_request_screen.dart';
import 'package:first_project/screens/home_screen.dart';
import 'package:first_project/screens/login_screen.dart';
import 'package:first_project/screens/public_profile_page.dart';
import 'package:first_project/screens/request_board_screen.dart';
import 'package:first_project/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    case CreateRequestScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => FormStateCubit()),
            BlocProvider(
              create: (context) => CreateRequestCubit(
                context.read<FormStateCubit>(),
                context.read<AllRequestsCubit>(),
                context.read<PendingRequestCubit>(),
              ),
            ),
          ],
          child: const CreateRequestScreen(),
        ),
      );
    case RequestBoardScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => UpdateRequestStatusCubit(),
          child: const RequestBoardScreen(),
        ),
      );
    case ApprovedRequestsScreen.routeName:
      return MaterialPageRoute(builder: (context) => const ApprovedRequestsScreen());
    case PublicProfilePage.routeName:
      final user = settings.arguments as User;
      return MaterialPageRoute(
        builder: (context) => PublicProfilePage(user: user),
      );
    default:
      return null;
  }
}
