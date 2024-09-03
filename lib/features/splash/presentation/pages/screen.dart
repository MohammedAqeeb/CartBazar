import 'package:cart_bazar/core/assets/app_images.dart';
import 'package:cart_bazar/core/theme/app_palletes.dart';
import 'package:cart_bazar/features/authentication/presentation/pages/sign_in/sign_in.dart';
import 'package:cart_bazar/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticatedUser) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SignInScreen(),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppPalletes.offWhite,
        body: Center(
          child: Transform.scale(
            scale: 1.5,
            child: Image.asset(
              AppImages.appLogo,
            ),
          ),
        ),
      ),
    );
  }
}