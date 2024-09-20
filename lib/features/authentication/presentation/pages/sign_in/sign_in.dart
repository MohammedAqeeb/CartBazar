import 'package:cart_bazar/core/common/navigator/app_navigator.dart';
import 'package:cart_bazar/core/common/widgets/custom_appbar.dart';
import 'package:cart_bazar/core/common/widgets/button/rounded_button.dart';
import 'package:cart_bazar/features/authentication/presentation/pages/sign_in/enter_password.dart';
import 'package:cart_bazar/features/authentication/presentation/pages/sign_up/sign_up_screen.dart';
import 'package:cart_bazar/features/authentication/presentation/widgets/rich_text_button.dart';
import 'package:cart_bazar/features/authentication/presentation/widgets/text_field.dart';
import 'package:flutter/material.dart';

import '../../widgets/sign_in_headline_text.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(hideBack: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 23,
            vertical: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SignInHeadlineText(
                text: 'Sign In',
              ),
              const SizedBox(height: 32),
              AuthTextField(
                controller: emailController,
                hintText: 'Email Address',
              ),
              const SizedBox(height: 16),
              RoundedButton(
                onPressed: () {
                  AppNavigator.push(
                    context,
                    const EnterPasswordScreen(),
                  );
                },
                title: 'Continue',
              ),
              const SizedBox(height: 16),
              RichTextButton(
                richTextTitle: 'Don\'t have an Account ? ',
                spanTextTitle: 'Create One',
                onTap: () {
                  AppNavigator.push(context, const SignUpScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
