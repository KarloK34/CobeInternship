import 'package:first_project/cubits/all_users_cubit.dart';
import 'package:first_project/cubits/singletons/app_lifecycle_cubit.dart';
import 'package:first_project/cubits/fab_cubit.dart';
import 'package:first_project/cubits/filtered_users_cubit.dart';
import 'package:first_project/cubits/search_query_cubit.dart';
import 'package:first_project/cubits/selected_filters_cubit.dart';
import 'package:first_project/cubits/singletons/user_cubit.dart';
import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/get_it/get_it.dart';
import 'package:first_project/ui_components/buttons/add_absence_button.dart';
import 'package:first_project/ui_components/buttons/add_button.dart';
import 'package:first_project/ui_components/buttons/create_request_button.dart';
import 'package:first_project/ui_components/bars/chip_bar.dart';
import 'package:first_project/ui_components/bars/my_app_bar.dart';
import 'package:first_project/ui_components/bars/my_search_bar.dart';
import 'package:first_project/ui_components/home/manage_requests_list.dart';
import 'package:first_project/ui_components/home/user_tiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      getIt<AppLifecycleCubit>().onAppPaused();
      return;
    }
    if (state == AppLifecycleState.resumed) getIt<AppLifecycleCubit>().onAppResumed(context);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = getIt<UserCubit>().state;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SelectedFiltersCubit()),
        BlocProvider(create: (context) => SearchQueryCubit()),
        BlocProvider(
          create: (context) => FilteredUsersCubit(
            allUsersCubit: context.read<AllUsersCubit>(),
            selectedFiltersCubit: context.read<SelectedFiltersCubit>(),
            searchQueryCubit: context.read<SearchQueryCubit>(),
          ),
        ),
      ],
      child: Scaffold(
        floatingActionButton: const AddButton(),
        backgroundColor: context.background,
        body: BlocBuilder<FabCubit, bool>(
          builder: (context, isFabExpanded) {
            return Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SafeArea(
                    child: Column(
                      children: [
                        MyAppBar(),
                        if (user != null && user.isAdmin) ManageRequestsList(),
                        SizedBox(height: 22),
                        MySearchBar(),
                        SizedBox(height: 10),
                        ChipBar(),
                        SizedBox(height: 10),
                        UserTiles(),
                      ],
                    ),
                  ),
                ),
                if (isFabExpanded) ...[
                  GestureDetector(
                    onTap: () => context.read<FabCubit>().toggle(),
                    child: Container(
                      color: context.black.withOpacity(0.5),
                    ),
                  ),
                  const Positioned(
                    right: 46,
                    bottom: 170,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 132,
                          height: 36,
                          child: AddAbsenceButton(),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: 154,
                          height: 36,
                          child: CreateRequestButton(),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
