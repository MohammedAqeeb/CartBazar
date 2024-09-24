import 'package:cart_bazar/core/common/navigator/app_navigator.dart';
import 'package:cart_bazar/core/common/widgets/button/rounded_button.dart';
import 'package:cart_bazar/features/authentication/presentation/pages/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container()),
          Center(
            child: SvgPicture.asset('assets/vectors/email_sending.svg'),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text('We Sent you an Email to reset your password.'),
          ),
          Expanded(child: Container()),
          _returnToLoginButton(context),
          Expanded(child: Container()),
        ],
      ),
    );
  }

  Widget _returnToLoginButton(BuildContext context) {
    return RoundedButton(
        onPressed: () {
          AppNavigator.pushReplacement(context, SignInScreen());
        },
        width: 250,
        title: 'Return to Login');
  }
}
