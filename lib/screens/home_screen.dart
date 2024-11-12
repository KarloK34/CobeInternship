import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:first_project/providers/app_lifecycle_notifier_provider.dart';
import 'package:first_project/providers/pending_requests_notifier_provider.dart';
import 'package:first_project/providers/user_state_provider.dart';
import 'package:first_project/screens/request_board_screen.dart';
import 'package:first_project/ui_components/shareable/add_button.dart';
import 'package:first_project/ui_components/bars/chip_bar.dart';
import 'package:first_project/ui_components/bars/my_app_bar.dart';
import 'package:first_project/ui_components/bars/my_search_bar.dart';
import 'package:first_project/ui_components/type_of_leave_tile.dart';
import 'package:first_project/ui_components/user_tiles.dart';
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
    final user = ref.read(userStateProvider);
    final pendingRequests = ref.watch(pendingRequestsNotifierProvider);
    return Scaffold(
      floatingActionButton: const AddButton(),
      backgroundColor: context.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            children: [
              const MyAppBar(),
              if (user != null && user.isAdmin)
                SizedBox(
                  height: pendingRequests.isEmpty ? 63 : 215,
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Manage requests',
                            style: context.titleMediumBold,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, RequestBoardScreen.routeName);
                            },
                            child: Text(
                              'See all',
                              style: context.labelSmall!.copyWith(color: context.secondary),
                            ),
                          ),
                        ],
                      ),
                      if (pendingRequests.isNotEmpty) SizedBox(height: 14),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: pendingRequests.length,
                                itemBuilder: (context, index) {
                                  return TypeOfLeaveTile(request: pendingRequests[index]);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              SizedBox(height: 22),
              const MySearchBar(),
              const SizedBox(height: 10),
              const ChipBar(),
              const SizedBox(height: 10),
              const UserTiles(),
            ],
          ),
        ),
      ),
    );
  }
}
