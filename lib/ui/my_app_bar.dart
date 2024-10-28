import 'package:first_project/utilities/app_fonts.dart';
import 'package:first_project/utilities/app_images.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 44.0,
            width: 44.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.dummyProfile),
                fit: BoxFit.fitWidth,
              ),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 15),
          const Expanded(
            child: Text(
              'Home',
              style: TextStyle(fontFamily: AppFonts.filsonPro, fontSize: 27, fontWeight: FontWeight.w700, color: Color(0xFF3D4766)),
            ),
          ),
          SizedBox(
            height: 44,
            width: 44,
            child: RawMaterialButton(
              onPressed: () {},
              elevation: 2.0,
              fillColor: Colors.white,
              shape: const CircleBorder(),
              child: const Icon(
                Icons.calendar_month,
                size: 20.0,
                color: Color(0xFF3D4766),
              ),
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            height: 44,
            width: 44,
            child: RawMaterialButton(
              onPressed: () {},
              elevation: 2.0,
              fillColor: Colors.white,
              shape: const CircleBorder(),
              child: const Icon(
                Icons.notifications_none_outlined,
                size: 20.0,
                color: Color(0xFF3D4766),
              ),
            ),
          )
        ],
      ),
    );
  }
}
