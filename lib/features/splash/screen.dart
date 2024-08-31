import 'package:cart_bazar/core/assets/app_images.dart';
import 'package:cart_bazar/core/theme/app_palletes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalletes.background,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage(
              AppImages.appLogo,
            ),
          ),
        ),
      ),
    );
  }
}
