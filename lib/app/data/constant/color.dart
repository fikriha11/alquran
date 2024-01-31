import 'package:flutter/material.dart';

const appPurple = Color(0xff431AA1);
const appPurpleLight1 = Color(0xff2E0D8A);
const appPurpleLight2 = Color(0xff9345F2);
const appPurpleLight3 = Color(0xff260F68);

const appWhite = Color(0xffFAF8FC);
const appOrange = Color(0xffE6704A);
const appGrey = Color(0xffB9A2D8);

const appPurpleDark = Color(0xff1E0771);

ThemeData appLight = ThemeData(
  primaryColor: appPurple,
  brightness: Brightness.light,
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: appPurpleLight3,
    ),
  ),
  iconTheme: const IconThemeData(color: appGrey),
  appBarTheme: const AppBarTheme(
    backgroundColor: appWhite,
    titleTextStyle: TextStyle(
      color: appPurple,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: appPurpleDark,
    ),
  ),
);

ThemeData appDark = ThemeData(
  primaryColor: appPurpleDark,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: appPurpleDark,
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: appWhite,
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: appPurple,
    titleTextStyle: TextStyle(
      color: appWhite,
      fontSize: 20,
    ),
    iconTheme: IconThemeData(
      color: appWhite,
    ),
  ),
);
