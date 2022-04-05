import 'package:capygram/screens/login_screen.dart';
import 'package:capygram/screens/signin_screen.dart';
import 'package:capygram/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBphuNlMBK2rhRsXLo1x8J7KT0tz8jYP5k",
        appId: "capygram-aae3d",
        messagingSenderId: "101216335639",
        storageBucket: "capygram-aae3d.appspot.com",
        projectId: "1:101216335639:web:7ec5614696637da2dca952",
      ),
    );
  } else {}
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Capygram',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      // home: const ResponsiveLayout(
      //     webScreenLayout: WebScreenLayout(),
      //     mobileScreenLayout: MobileScreenLayout()),
      home: const SignupScreen(),
    );
  }
}
