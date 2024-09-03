import 'package:cart_bazar/core/common/navigator/app_navigator.dart';
import 'package:cart_bazar/core/common/widgets/custom_appbar.dart';
import 'package:cart_bazar/core/common/widgets/rounded_button.dart';
import 'package:cart_bazar/features/authentication/presentation/pages/sign_in/forgort_password.dart';
import 'package:cart_bazar/features/authentication/presentation/widgets/rich_text_button.dart';
import 'package:cart_bazar/features/authentication/presentation/widgets/sign_in_headline_text.dart';
import 'package:cart_bazar/features/authentication/presentation/widgets/text_field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final firtNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
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
                text: 'Create Account',
              ),
              const SizedBox(height: 32),
              AuthTextField(
                controller: firtNameController,
                hintText: 'First Name',
              ),
              const SizedBox(height: 16),
              AuthTextField(
                controller: lastNameController,
                hintText: 'Last Name',
              ),
              const SizedBox(height: 16),
              AuthTextField(
                controller: emailController,
                hintText: 'Email Address',
              ),
              const SizedBox(height: 16),
              AuthTextField(
                controller: passwordController,
                hintText: 'Password',
              ),
              const SizedBox(height: 40),
              RoundedButton(
                onPressed: () {},
                title: 'Continue',
              ),
              const SizedBox(height: 20),
              RichTextButton(
                richTextTitle: 'Forgot Password ? ',
                spanTextTitle: 'Reset',
                onTap: () {
                  AppNavigator.push(
                    context,
                    const ForgortPassword(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
