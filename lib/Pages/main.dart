import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_projects/Core/store.dart';
import 'package:flutter_projects/Pages/cart_page.dart';
import 'package:flutter_projects/Pages/home_detail_page.dart';
import 'package:flutter_projects/Widgets/Themes.dart';
import 'package:flutter_projects/Pages/home_page.dart';
import 'package:flutter_projects/Pages/login_page.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Routes/MyRoutes.dart';

void main() {
  runApp(VxState
    (
    child: MyApp(),
      store: MyStore()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // bringVeg(bag: true);

    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
          brightness: Brightness.dark, primarySwatch: Colors.deepOrange),
      initialRoute: MyRoutes.homeRoute ,

      routes: {
        "/": (context) => HomePage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
        // MyRoutes.detailRoute: (context) => HomeDetailPage()
      },
    );
  }
}
