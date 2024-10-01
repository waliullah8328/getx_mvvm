import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_mvvm/resource/component/round_button.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/view_model/controller/login/login_controller.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginViewModel());
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  Text("login".tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: loginController.emailController.value,
                focusNode: loginController.emailFocusNode.value,
                validator: (value){
                  if(value!.isEmpty){
                    Utils.snackBarMessage(title: "email_hint".tr, message: "password_validator".tr);
                  }
                },
                onFieldSubmitted: (value){
                  Utils.fieldFocusChange(context, loginController.emailFocusNode.value, loginController.passwordFocusNode.value);
                },
                decoration: InputDecoration(
                  hintText: "email_hint".tr,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),

              ),
              const SizedBox(height: 10,),
              TextFormField(
                obscureText: true,
                obscuringCharacter: "*",
                controller: loginController.passwordController.value,
                focusNode: loginController.passwordFocusNode.value,
                validator: (value){
                  if(value!.isEmpty){
                    Utils.snackBarMessage(title: "password_hint".tr, message: "email_validator".tr);
                  }
                },
                onFieldSubmitted: (value){
                  Utils.fieldFocusChange(context, loginController.emailFocusNode.value, loginController.passwordFocusNode.value);
                },
                decoration: InputDecoration(
                  hintText: "password_hint".tr,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                ),
              ),
              const SizedBox(height: 40,),
              Obx(() => RoundButton(title: "login".tr, onPress: (){
                if(_formKey.currentState!.validate()){
                  loginController.loginApi();

                }
              },width: 200,buttonColor: Colors.green,textColor: Colors.white,isLoading: loginController.isloading.value,)),
            ],
          ),
        ),
      ),


    );
  }
}
