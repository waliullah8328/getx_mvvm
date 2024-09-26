
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/resource/colors/app_colors.dart';

class InternetExceptionWidgets extends StatefulWidget {
  final VoidCallback onPress;
   InternetExceptionWidgets({super.key, required this.onPress});

  @override
  State<InternetExceptionWidgets> createState() => _InternetExceptionWidgetsState();
}

class _InternetExceptionWidgetsState extends State<InternetExceptionWidgets> {
  @override
  Widget build(BuildContext context) {
    final height =  MediaQuery.of(context).size.height;
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: height*.15,),
          Icon(Icons.cloud_off,color: AppColors.redColor,),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Center(child: Text("internet_exceptions".tr,textAlign: TextAlign.center,),),
          ),
          SizedBox(height: height*.15,),
          InkWell(
            onTap: widget.onPress,
            child: Container(
              height: 40,
              width: 160,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(50),
            
              ),
                child:  Center(child: Text("Retry",style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),))),
          )
        ],
      ),
    );
  }
}
