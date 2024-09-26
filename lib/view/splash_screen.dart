import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/data/app_exceptions.dart';
import 'package:getx_mvvm/resource/route/route_name.dart';
import 'package:getx_mvvm/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("profile".tr),
      ),
      body:  ElevatedButton(onPressed: (){
        Get.toNamed(RouteName.signInScreen );

      }, child: Text("LoginScreen")),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(onPressed: (){
            Get.updateLocale(Locale("en","US"));
          }, child: Text("English")),
          ElevatedButton(onPressed: (){
            Get.updateLocale(Locale("bn","BD"));
          }, child: Text("Bangla")),

      ],),/*FloatingActionButton(onPressed: (){
        Utils.toastMessage(message: "Bottom toast");
        Utils.toastMessageCenter(message: "Center toast");
      }
        ,),*/

    );
  }
}
