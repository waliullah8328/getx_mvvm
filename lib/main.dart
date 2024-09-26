import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_mvvm/resource/getx_localization/languages.dart';
import 'package:getx_mvvm/resource/route/routes.dart';
import 'package:getx_mvvm/view/splash_screen.dart';
import 'package:getx_mvvm/view_model/sign_in_controller.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    final storage = GetStorage();
    bool isBangla = storage.read("language")?? false;
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      // For Bangla Language

      translations: Languages(),
      locale: isBangla ==true?const Locale("bn","BD"):const Locale("en","US"),
      fallbackLocale: const Locale("en","Us"),

      // For Get path 
      getPages: AppRoute.appRoute(),

    );
  }
}


