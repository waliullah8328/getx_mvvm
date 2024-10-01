import 'package:get/get.dart';
import 'package:getx_mvvm/resource/route/route_name.dart';
import 'package:getx_mvvm/view/home/home_screen.dart';
import 'package:getx_mvvm/view/sign_in_screen.dart';

import 'package:getx_mvvm/view/splash_screen.dart';

import '../../view/signin/signin_view.dart';

class AppRoute{

  static appRoute()=>[
    GetPage(name:RouteName.splashScreen, page: ()=> const SplashScreen(),transition: Transition.leftToRight,transitionDuration: const Duration(seconds: 2)),
    GetPage(name:RouteName.signInScreen, page: ()=> const SignInScreen()),
    GetPage(name:RouteName.signInView, page: ()=> const SignInView()),
    GetPage(name:RouteName.homeScreen, page: ()=> const HomeScreen()),

  ];


}