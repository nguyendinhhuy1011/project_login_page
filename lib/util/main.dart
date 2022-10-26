import 'package:flutter/material.dart';

import 'package:homework2/exercise2/left_menu_bar.dart';
import 'package:homework2/exercise2/issue_page/page/newFeed.dart';
import 'package:homework2/exercise2/profile_page.dart';
import 'package:homework2/exercise2/register_screen.dart';
import 'package:homework2/exercise2/report_page.dart';
import 'package:homework2/exercise2/splash/splash_page.dart';

import '../exercise2/issue_page/page/issue_page.dart';
import '../exercise2/login_page.dart';
import '../exercise2/my_Area/area_page.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: const MyAreaPage(),
    );
  }
}

