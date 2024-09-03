import 'package:cart_bazar/core/theme/app_palletes.dart';
import 'package:flutter/material.dart';

class SignInHeadlineText extends StatelessWidget {
  final String text;
  const SignInHeadlineText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 32,
        color: AppPalletes.offWhite,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
