import 'package:capygram/responsive/responsive_layout_screen.dart';
import 'package:capygram/utils/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Capygram',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor
      ),
      home: ResponsiveLayout(webScreenLayout: webScreenLayout, mobileScreenLayout: mobileScreenLayout),
    );
  }
}

