import 'package:flutter/material.dart';

class Themes {
  final lightTheme = ThemeData.light(useMaterial3: true).copyWith(
    colorScheme: ColorScheme.light(
      primary: Colors.black,
      background: Colors.red,
      secondary: Colors.tealAccent.shade700,
    ),
    listTileTheme: ListTileThemeData(tileColor: Colors.white),
    primaryColor: Colors.orange,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.black,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        // foregroundColor: Colors.black,
        // backgroundColor: Colors.grey.shade300,
        ),
  );

  final dartTheme = ThemeData.dark(useMaterial3: true).copyWith(
    colorScheme: ColorScheme.dark(
      primary: Colors.black,
      background: Colors.grey.shade800,
      secondary: Colors.tealAccent,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.white,
    ),
    listTileTheme: ListTileThemeData(tileColor: Colors.grey.shade800),
    primaryColor: Colors.orange,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        // foregroundColor: Colors.white,
        // backgroundColor: Colors.teal.shade500,
        ),
  );
}
