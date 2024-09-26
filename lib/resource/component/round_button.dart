import 'package:flutter/material.dart';
import 'package:getx_mvvm/resource/colors/app_colors.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    super.key,
    required this.title,
    required this.onPress,
    this.isLoading = false,
    this.height = 50,
    this.width = 60,
    this.textColor = AppColors.primaryButtonColor,
    this.buttonColor = AppColors.primaryTextColor,  this.fontSize = 16.0,  this.radius = 10.0,
  });

  final bool isLoading;
  final String title;
  final double height, width,fontSize,radius;
  final VoidCallback onPress;
  final Color textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: isLoading? const Center(child: CircularProgressIndicator()):Center(child: Text(title,style: TextStyle(color: textColor,fontSize: fontSize),),),
      ),
    );
  }
}
