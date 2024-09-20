import 'package:cart_bazar/core/theme/app_palletes.dart';
import 'package:flutter/material.dart';

class SignInHeadlineText extends StatelessWidget {
  final String text;
  final double fontSize;
  const SignInHeadlineText({
    super.key,
    required this.text,
    this.fontSize = 32,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: AppPalletes.offWhite,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
