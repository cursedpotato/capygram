import 'package:capygram/providers/user_providers.dart';
import 'package:capygram/responsive/mobile_screen_layout.dart';
import 'package:capygram/responsive/responsive_layout_screen.dart';
import 'package:capygram/responsive/web_screen_layout.dart';
import 'package:capygram/screens/login_screen.dart';
import 'package:capygram/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Capygram',
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
        // home: const ResponsiveLayout(
        //     webScreenLayout: WebScreenLayout(),
        //     mobileScreenLayout: MobileScreenLayout()),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return const ResponsiveLayout(
                  webScreenLayout: WebScreenLayout(),
                  mobileScreenLayout: MobileScreenLayout(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child:  CircularProgressIndicator(color: primaryColor),
                );
              }
              
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child:  CircularProgressIndicator(color: primaryColor),
                );
              }
            return const LoginScreen(); 
          },
        ),
      ),
    );
  }
}
