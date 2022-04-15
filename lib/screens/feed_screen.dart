import 'package:capygram/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeedScreen  extends StatelessWidget {
  const FeedScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor:  mobileBackgroundColor,
        centerTitle: false,
        title: SvgPicture.asset("assets"),
      ),
    );
  }
}