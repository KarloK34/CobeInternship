import 'package:first_project/utilities/app_colors.dart';
import 'package:first_project/utilities/app_fonts.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static const TextStyle heading = TextStyle(
    fontFamily: AppFonts.filsonPro,
    fontWeight: FontWeight.w700,
    fontSize: 28,
    color: Color(0xFF3D4766),
  );
  static const TextStyle heading2 = TextStyle(
    fontFamily: AppFonts.filsonPro,
    fontWeight: FontWeight.w700,
    fontSize: 17,
    color: Color(0xFF3D4766),
  );
  static const TextStyle title2Bold = TextStyle(
    fontFamily: AppFonts.filsonPro,
    fontWeight: FontWeight.w700,
    fontSize: 22,
    color: Color(0xFF3D4766),
  );
  static const TextStyle title3Regular = TextStyle(
    fontFamily: AppFonts.filsonPro,
    fontWeight: FontWeight.w400,
    fontSize: 20,
    color: Colors.white,
  );
  static const TextStyle dialogText = TextStyle(
    fontFamily: AppFonts.filsonPro,
    fontWeight: FontWeight.w400,
    fontSize: 17,
    color: Color(0xFF3D4766),
  );
  static const TextStyle labelRegular = TextStyle(
    fontFamily: AppFonts.filsonPro,
    fontWeight: FontWeight.w400,
    fontSize: 15,
    color: Color(0xFF3D4766),
  );
  static const TextStyle regular15 = TextStyle(
    fontFamily: AppFonts.filsonPro,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: Color(0xFFBCC4DC),
  );
  static const TextStyle regular13 = TextStyle(
    fontFamily: AppFonts.filsonPro,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: Color(0xFFBCC4DC),
  );
  static const TextStyle white13 = TextStyle(
    fontFamily: AppFonts.filsonPro,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  static const TextStyle orange15 = TextStyle(
    fontFamily: AppFonts.filsonPro,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.orange,
  );
}
