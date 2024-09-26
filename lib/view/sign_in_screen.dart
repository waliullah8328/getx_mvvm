import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_mvvm/resource/colors/app_colors.dart';
import 'package:getx_mvvm/resource/component/internet_exceptions_widgets.dart';
import 'package:getx_mvvm/resource/component/round_button.dart';

import '../resource/component/customizedTextWidget.dart';
import '../resource/component/general_exceptions.dart';
import '../view_model/sign_in_controller.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Sign_in"),
        actions: [
          Row(
            children: [
              Text("English"),
              Obx(() => Switch(
                  value: controller.isSwitchOn.value,
                  onChanged: (value) {
                    controller.changeSwitchButton(value);
                  })),
              Text("Bangla"),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GeneralExceptionWidgets(
              onPress: () {},
            ),
            SizedBox(
              height: 50,
            ),
            CustomizedTextWidget(title: "morning".tr,),
            SizedBox(
              height: 50,
            ),
            Text(
              "description".tr,
              style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            RoundButton(
              title: "Login",
              onPress: () {},
              width: 290,
              buttonColor: Colors.green,
              textColor: Colors.white,
              fontSize: 20,
              radius: 8,
            ),
          ],
        ),
      ),
    );
  }
}


