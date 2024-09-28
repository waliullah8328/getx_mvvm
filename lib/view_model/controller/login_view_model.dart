 import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:getx_mvvm/repository/login_repository/login_repository.dart';

import '../../utils/utils.dart';

class LoginViewModel extends GetxController{

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
      Utils.snackBarMessage(title: "Success", message: "Successfully Login");

    }).onError((error, stackTrace) {
      isloading.value = false;
      Utils.snackBarMessage(title: "Error", message: e.toString());

    });


  }



}