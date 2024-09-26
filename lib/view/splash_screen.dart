import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/data/app_exceptions.dart';
import 'package:getx_mvvm/resource/assets/image_assets.dart';
import 'package:getx_mvvm/resource/route/route_name.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/widgets/screen_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Get.toNamed(RouteName.signInScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return const ScreenBackground(child:
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("MVVM IN FLUTTER",style: TextStyle(fontSize: 18),),
        ),
      ],
    ));
  }
}
