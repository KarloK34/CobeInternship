import 'package:first_project/ui/add_button.dart';
import 'package:first_project/ui/chip_bar.dart';
import 'package:first_project/ui/my_app_bar.dart';
import 'package:first_project/ui/my_search_bar.dart';
import 'package:first_project/ui/user_tiles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: AddButton(),
      backgroundColor: Color(0xFFE9ECF4),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            children: [
              MyAppBar(),
              MySearchBar(),
              SizedBox(
                height: 10,
              ),
              ChipBar(),
              SizedBox(
                height: 10,
              ),
              UserTiles()
            ],
          ),
        ),
      ),
    );
  }
}
