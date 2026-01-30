import 'package:flutter/cupertino.dart';

class AppColors {
  static Color primaryColor = const Color(0xFF2683EB);
  static Color backgroundColor = const Color(0xFF010101);
  static Color cardColor = const Color(0xFF2F2F2F);
  static Color cardLightColor = const Color(0xFF555555);
  static Color borderColor = const Color(0xFF2683EB);
  static Color textColor = const Color(0xFFFFFFFF);
  static Color subTextColor = const Color(0xFFE8E8E8);
  static Color hintColor = const Color(0xFFB5B5B5);
  static Color greyColor = const Color(0xFF818898);
  static Color fillColor = const Color(0xFFE9F3FD).withValues(alpha: 0.3);
  static Color dividerColor = const Color(0xFF555555);
  static Color shadowColor = const Color(0xFF2B2A2A);
  static Color bottomBarColor = const Color(0xFF343434);

  static Color navbarColor = const Color(0xFF222222);
  static Color unselectedNavColor = const Color(0xFFF9F2FF);
  static Color selectedNavColor = const Color(0xFFE8B100);
  static Color searchTextColor = const Color(0xFF818898);
  static Color searchFieldBorderColor = const Color(0xFFE19396);
  static Color searchFieldFillColor = const Color(0xFFF9E8E8);

  static Color subHeadingColor = const Color(0xFF818898);
  static Color secondaryColor = const Color(0xB0000000).withValues(alpha: 0.7);
  static Color red = const Color(0xFFCB4448);
  static Color anotherRed = const Color(0xFFBE151A);
  static Color deepRed = const Color(0xFF690C0E);
  static Color borderRed = const Color(0xFFEBB6B8);
  static Color lightRed = const Color(0xFFF9E8E8);
  static Color lightYellow = const Color(0xFFFDF7E6);
  static Color yellow = const Color(0xFFF0CB54);
  static Color grey = const Color(0xFFEBF2FE);
  static Color yellowBorder = const Color(0xFFF8E7B0);
  static Color redBg = const Color(0xFFBE151A);
  static Color greenBg = const Color(0xFF34C759);
  static Color yellowBg = const Color(0xFFD3A100);
  static Color brown = const Color(0xFF614A00);
  static Color darkBrown = const Color(0xFF50090B);

  static BoxShadow shadow = BoxShadow(
    blurRadius: 4,
    spreadRadius: 0,
    color: shadowColor,
    offset: const Offset(0, 2),
  );
}
