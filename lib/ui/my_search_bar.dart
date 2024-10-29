import 'package:first_project/providers/user_notifier.dart';
import 'package:first_project/utilities/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MySearchBar extends StatefulWidget {
  const MySearchBar({
    super.key,
  });

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();

    _controller.addListener(() {
      final query = _controller.text;
      context.read<UserNotifier>().updateSearchQuery(query);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
      child: SearchBar(
        controller: _controller,
        elevation: const WidgetStatePropertyAll(0),
        leading: const SizedBox(
          height: 20,
          width: 20,
          child: Icon(
            Icons.search,
            color: Color(0xFFBCC4DC),
          ),
        ),
        hintText: 'Search...',
        hintStyle: const WidgetStatePropertyAll(
          TextStyle(
            fontFamily: AppFonts.filsonPro,
            color: Color(0xFFBCC4DC),
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: const WidgetStatePropertyAll(Colors.white),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      ),
    );
  }
}
