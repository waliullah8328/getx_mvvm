import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text("Sign_in"),),
      body: Text("morning".tr,style: const TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),

    );
  }
}
