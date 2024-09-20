import 'package:cart_bazar/core/common/navigator/app_navigator.dart';
import 'package:cart_bazar/core/common/widgets/custom_appbar.dart';
import 'package:cart_bazar/core/common/widgets/button/rounded_button.dart';
import 'package:cart_bazar/features/authentication/presentation/pages/sign_in/forgort_password.dart';
import 'package:cart_bazar/features/authentication/presentation/widgets/rich_text_button.dart';
import 'package:cart_bazar/features/authentication/presentation/widgets/text_field.dart';
import 'package:flutter/material.dart';

import '../../widgets/sign_in_headline_text.dart';

class EnterPasswordScreen extends StatefulWidget {
  const EnterPasswordScreen({super.key});

  @override
  State<EnterPasswordScreen> createState() => _EnterPasswordScreenState();
}

class _EnterPasswordScreenState extends State<EnterPasswordScreen> {
  final passWordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
                text: 'Sign In',
              ),
              const SizedBox(height: 32),
              AuthTextField(
                controller: passWordController,
                hintText: 'Password',
              ),
              const SizedBox(height: 16),
              RoundedButton(
                onPressed: () {},
                title: 'Continue',
              ),
              const SizedBox(height: 16),
              RichTextButton(
                richTextTitle: 'Forgot Password ? ',
                spanTextTitle: 'Reset',
                onTap: () {
                  AppNavigator.push(context, const ForgortPassword());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
