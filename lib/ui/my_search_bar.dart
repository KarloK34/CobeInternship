import 'package:first_project/utilities/app_fonts.dart';
import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
      child: SearchBar(
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
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
