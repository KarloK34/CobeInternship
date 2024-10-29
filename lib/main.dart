import 'package:first_project/notifiers/all_users_notifier.dart';
import 'package:first_project/notifiers/filters_notifier.dart';
import 'package:first_project/notifiers/search_query_notifier.dart';
import 'package:first_project/routes/app_routes.dart';
import 'package:first_project/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FiltersNotifier()),
        ChangeNotifierProvider(create: (_) => SearchQueryNotifier()),
        ChangeNotifierProxyProvider2(
          create: (BuildContext context) => AllUsersNotifier(context.read<FiltersNotifier>(), context.read<SearchQueryNotifier>())..fetchUsers(),
          update: (BuildContext context, FiltersNotifier filtersNotifier, SearchQueryNotifier searchQueryNotifier, AllUsersNotifier? allUsersNotifier) {
            return allUsersNotifier ?? AllUsersNotifier(filtersNotifier, searchQueryNotifier);
          },
        ),
      ],
      child: const MaterialApp(
        initialRoute: HomePage.routeName,
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
