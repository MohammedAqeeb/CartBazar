import 'package:cart_bazar/core/common/cubit/submit_button/submit_button_cubit.dart';
import 'package:cart_bazar/core/common/navigator/app_navigator.dart';
import 'package:cart_bazar/core/common/widgets/button/submit_state_button.dart';
import 'package:cart_bazar/core/common/widgets/custom_appbar.dart';
import 'package:cart_bazar/features/authentication/domain/usecase/reset_password_usecase.dart';
import 'package:cart_bazar/features/authentication/presentation/pages/sign_in/reset_password.dart';
import 'package:cart_bazar/features/authentication/presentation/widgets/sign_in_headline_text.dart';
import 'package:cart_bazar/init_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/text_field.dart';

class ForgortPassword extends StatelessWidget {
  ForgortPassword({super.key});

  final resetEmailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: BlocListener<SubmitButtonCubit, SubimitButtonState>(
        listener: (context, state) {
          if (state is SubmitButtonFailure) {
            var snackBar = SnackBar(
              content: Text(state.errorMessage),
              behavior: SnackBarBehavior.floating,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else if (state is SubmitButtonSuccess) {
            AppNavigator.push(context, const ResetPasswordScreen());
          }
        },
        child: SingleChildScrollView(
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
                  controller: resetEmailController,
                  hintText: 'Enter Email Address',
                ),
                const SizedBox(height: 16),
                SubmitStateButton(
                  onPressed: () {
                    context.read<SubmitButtonCubit>().onButtonSubmit(
                        param: resetEmailController.text,
                        usecase: serviceLocator<ResetPasswordUseCase>());
                  },
                  title: 'Continue',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
