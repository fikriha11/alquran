import 'package:flutter/material.dart';

const appPurple = Color(0xff431AA1);
const appPurpleDark = Color(0xff1E0771);
const appPurpleLight1 = Color(0xff9345F2);
const appPurpleLight2 = Color(0xffB9A2D8);
const appWhite = Color(0xffFAF8FC);
const appOrange = Color(0xffE6704A);
const appGrey = Color(0xffB9A2D8);

ThemeData appLight = ThemeData(
  primaryColor: appPurple,
  brightness: Brightness.light,
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: appWhite,
    ),
  ),
  iconTheme: const IconThemeData(color: appWhite),
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
