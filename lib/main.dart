import 'package:flutter/material.dart';
import 'package:flutter_fundamental_1/common/constants.dart';
import 'package:flutter_fundamental_1/common/routes.dart';
import 'package:flutter_fundamental_1/common/styles.dart';
import 'package:flutter_fundamental_1/screens/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodies',
      theme: ThemeData(
        textTheme: textTheme.apply(
          bodyColor: kTyphographyColor[100],
          displayColor: kTyphographyColor[80],
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: kDefaultBackgroundColor,
          selectedItemColor: kPrimaryColorOrange[100],
          unselectedItemColor: kGrayColor[50],
        ),
        fontFamily: "Sofia Pro",
        scaffoldBackgroundColor: kDefaultBackgroundColor,
        primarySwatch: Colors.amber,
      ),
      routes: router,
      home: const MainPage(),
    );
  }
}
