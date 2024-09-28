

import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_mvvm/resource/route/route_name.dart';

class SplashServices{

  void isLogin(){
    Timer(const Duration(seconds: 3), () {

      Get.toNamed(RouteName.signInScreen);

    });

  }
}