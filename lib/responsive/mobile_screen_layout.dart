import 'package:capygram/models/user.dart';
import 'package:capygram/providers/user_providers.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  
  
  @override
  Widget build(BuildContext context) {

    UserModel user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: Center(child: Text("${user.username}")),
    );
  }
}
