import 'package:cart_bazar/core/theme/app_theme.dart';
import 'package:cart_bazar/features/splash/screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cart Bazar',
      theme: AppTheme.themeData,
      home: const SplashScreen(),
    );
  }
}
