import 'package:flutter/material.dart';
import 'package:mypcot_assesment/view/home_page/home_page.dart';
import 'package:mypcot_assesment/view/home_page/widget/carousel.dart';
import 'package:mypcot_assesment/view/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home:  ScreenSplash1(),
    );
  }
}



