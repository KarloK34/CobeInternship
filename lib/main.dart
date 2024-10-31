import 'package:first_project/notifiers/all_users_notifier.dart';
import 'package:first_project/notifiers/filtered_users_notifier.dart';
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
        ChangeNotifierProvider(create: (_) => AllUsersNotifier()..fetchUsers()),
        ChangeNotifierProvider(create: (_) => FiltersNotifier()),
        ChangeNotifierProvider(create: (_) => SearchQueryNotifier()),
        ChangeNotifierProxyProvider3(
          create: (BuildContext context) => FilteredUsersNotifier(),
          update: (
            BuildContext context,
            AllUsersNotifier allUsersNotifier,
            FiltersNotifier filtersNotifier,
            SearchQueryNotifier searchQueryNotifier,
            FilteredUsersNotifier? filteredUsersNotifier,
          ) {
            filteredUsersNotifier?.filterUsers(
              allUsersNotifier.allUsers,
              filtersNotifier.selectedFilters,
              searchQueryNotifier.searchQuery,
            );
            return filteredUsersNotifier!;
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
