// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vs_app_test_v1/detailScreen.dart';
import 'homeScreen.dart';
// import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "The realestate app",
      // home: Home(),
      initialRoute: 'home',
      routes: {
        'home': (context) => Home(),
        // 'detailedScreen': (context) => DetailedEstatesView(),
      },
    );
  }
}
