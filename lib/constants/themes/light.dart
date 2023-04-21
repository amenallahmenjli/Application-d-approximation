import 'package:flutter/material.dart';

import '../colors.dart';
import 'text_styles.dart';

final lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: lightColor,
      foregroundColor: darkColor,
      titleTextStyle: appBarTextStyleLight,
      centerTitle: true,
      elevation: 0.0,
    ),
    scaffoldBackgroundColor: lightColor,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: lightColor,
      secondary: secondaryColor,
      onSecondary: lightColor,
      error: errorColor,
      onError: lightColor,
      background: lightColor,
      onBackground: darkColor,
      surface: primaryColor,
      onSurface: lightColor,
    ));
