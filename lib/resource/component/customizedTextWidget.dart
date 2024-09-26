import 'package:flutter/cupertino.dart';

import '../colors/app_colors.dart';

class CustomizedTextWidget extends StatelessWidget {
  const CustomizedTextWidget({
    super.key,
    required this.title,
    this.fontFamily = "Bold",
    this.fontSize = 14,
    this.letterSpacing = 0.5,
    this.color = AppColors.primaryColor,
  });

  final String title, fontFamily;
  final double fontSize, letterSpacing;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:  TextStyle(
        fontSize:fontSize,
        fontWeight: FontWeight.bold,
        letterSpacing:letterSpacing,
        fontFamily: "Bold",
      ),
    );
  }
}