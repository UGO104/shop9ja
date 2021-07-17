import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Themes {
  Themes._();
  static final Color textDark = Colors.black;
  static final Color textLight = Colors.white;
  static final Color textDisabled = Colors.grey;
  static final Color textFocused = Colors.white;

  static final Color bgDark = Colors.black;
  static final Color bgLight = Colors.white;
  static final Color bgDisabled = Colors.grey;
  static final Color bgFocused = Colors.blue.shade800;
  static final Color accentColor = Colors.amber.shade600;

  static final ThemeData light = ThemeData(
    primaryColor: Colors.white,
    accentColor: accentColor,
    focusColor: bgFocused,
    textTheme: TextTheme(
        headline5: TextStyle(color: Colors.black.withAlpha(200)),
        headline6: TextStyle(color: textDisabled)
    ),
    appBarTheme: AppBarTheme(
      elevation: 5,
      backgroundColor: bgLight,
      textTheme: TextTheme(
        headline6: TextStyle(fontSize: 20, color: textDark)
      ),
      iconTheme: IconThemeData(color: textDisabled),
      actionsIconTheme:  IconThemeData(color: textDisabled),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 20,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedItemColor: bgLight,
      selectedItemColor: bgLight.withOpacity(.5),
    ),
  );

  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
  );

}