import 'package:cart_bazar/core/common/widgets/custom_appbar.dart';
import 'package:cart_bazar/features/authentication/presentation/widgets/sign_in_headline_text.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/widgets/rounded_button.dart';
import '../../widgets/text_field.dart';

class ForgortPassword extends StatefulWidget {
  const ForgortPassword({super.key});

  @override
  State<ForgortPassword> createState() => _ForgortPasswordState();
}

class _ForgortPasswordState extends State<ForgortPassword> {
  final forgotPasswordController = TextEditingController();
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
                text: 'Forgot Password',
              ),
              const SizedBox(height: 32),
              AuthTextField(
                controller: forgotPasswordController,
                hintText: 'Enter Email Address',
              ),
              const SizedBox(height: 16),
              RoundedButton(
                onPressed: () {},
                title: 'Continue',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
