import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getx_mvvm/resource/colors/app_colors.dart';

class Utils{


  static void fieldFocusChange(BuildContext context, FocusNode current, FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage({required String message}){
    Fluttertoast.showToast(msg: message,backgroundColor: AppColors.blackColor,gravity: ToastGravity.BOTTOM);

  }
  static toastMessageCenter({required String message}){
    Fluttertoast.showToast(msg: message,backgroundColor: AppColors.blackColor,gravity: ToastGravity.CENTER);

  }

  static snackBarMessage({required String title, required String message}){
    Get.snackbar(title, message);

  }


}