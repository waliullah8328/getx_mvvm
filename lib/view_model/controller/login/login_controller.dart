 import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:getx_mvvm/models/login/user_model.dart';
import 'package:getx_mvvm/repository/login_repository/login_repository.dart';
import 'package:getx_mvvm/resource/route/route_name.dart';
import 'package:getx_mvvm/view_model/controller/user_preference/user_preference_view_model.dart';

import '../../../utils/utils.dart';

class LoginViewModel extends GetxController{

  UserPreferences userPreferences = UserPreferences();

  final _api = LoginRepository();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  RxBool isloading = false.obs;


  void loginApi(){
    isloading.value = true;
    Map data ={
      "password": passwordController.value.text,
      "phone": emailController.value.text,

    };
    _api.loginApi(data).then((value) {
      isloading.value = false;
      if(value["error"]== "user not found"){
        Utils.snackBarMessage(title: "Login", message: value["error"]);
      }
      else{

        userPreferences.saveUser(UserModel.fromJson(value)).then((value){
          Get.delete<LoginViewModel>();

          Get.toNamed(RouteName.homeScreen)?.then((value) {});
          Utils.snackBarMessage(title: "Login", message: "Successfully Login");

        }).onError((error, stackTrace) {

        });

        
      }
     

    }).onError((error, stackTrace) {
      isloading.value = false;
      Utils.snackBarMessage(title: "Error", message: e.toString());

    });


  }



}