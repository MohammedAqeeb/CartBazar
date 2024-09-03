import 'package:cart_bazar/core/theme/app_theme.dart';
import 'package:cart_bazar/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:cart_bazar/features/splash/presentation/pages/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..onAppStarted(),
      child: MaterialApp(
        title: 'Cart Bazar',
        theme: AppTheme.themeData,
        home: const SplashScreen(),
      ),
    );
  }
}
