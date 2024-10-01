

import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_mvvm/resource/route/route_name.dart';
import 'package:getx_mvvm/view_model/controller/user_preference/user_preference_view_model.dart';

class SplashServices{

  UserPreferences userPreferences = UserPreferences();

  void isLogin() {
    userPreferences.getUser().then((value) {
      // Check if token is null before accessing it
      if (value.token == null || value.token!.isEmpty) {
        Timer(const Duration(seconds: 3), () {
          Get.toNamed(RouteName.signInScreen);
        });
      } else {
        Timer(const Duration(seconds: 3), () {
          Get.toNamed(RouteName.homeScreen);
        });
      }
    }).catchError((error) {
      print("Error fetching user: $error");
      Get.toNamed(RouteName.signInScreen); // Optional: fallback in case of error
    });
  }
}