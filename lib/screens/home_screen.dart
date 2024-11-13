import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/providers/notifier_providers/app_lifecycle_notifier_provider.dart';
import 'package:first_project/providers/state_providers/fab_state_provider.dart';
import 'package:first_project/providers/notifier_providers/pending_requests_notifier_provider.dart';
import 'package:first_project/providers/state_providers/user_state_provider.dart';
import 'package:first_project/ui_components/buttons/add_absence_button.dart';
import 'package:first_project/ui_components/buttons/add_button.dart';
import 'package:first_project/ui_components/buttons/create_request_button.dart';
import 'package:first_project/ui_components/bars/chip_bar.dart';
import 'package:first_project/ui_components/bars/my_app_bar.dart';
import 'package:first_project/ui_components/bars/my_search_bar.dart';
import 'package:first_project/ui_components/home/manage_requests_list.dart';
import 'package:first_project/ui_components/home/user_tiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const routeName = '/home';

  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with WidgetsBindingObserver {
  late final AppLifecycleNotifier appLifecycleNotifier;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    appLifecycleNotifier = ref.read(appLifecycleNotifierProvider.notifier);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      appLifecycleNotifier.onAppPaused();
      return;
    }
    if (state == AppLifecycleState.resumed) appLifecycleNotifier.onAppResumed(context);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isFabExtended = ref.watch(fabStateProvider);
    final user = ref.read(userStateProvider);
    final pendingRequests = ref.watch(pendingRequestsNotifierProvider);
    return Scaffold(
      floatingActionButton: const AddButton(),
      backgroundColor: context.background,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: SafeArea(
              child: Column(
                children: [
                  MyAppBar(),
                  if (user != null && user.isAdmin) ManageRequestsList(pendingRequests: pendingRequests),
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
          if (isFabExtended) ...[
            GestureDetector(
              onTap: () => ref.read(fabStateProvider.notifier).state = !ref.read(fabStateProvider.notifier).state,
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
      ),
    );
  }
}
