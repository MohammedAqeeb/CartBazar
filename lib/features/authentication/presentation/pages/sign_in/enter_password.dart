import 'package:cart_bazar/core/common/cubit/submit_button/submit_button_cubit.dart';
import 'package:cart_bazar/core/common/navigator/app_navigator.dart';
import 'package:cart_bazar/core/common/widgets/button/submit_state_button.dart';
import 'package:cart_bazar/core/common/widgets/custom_appbar.dart';
import 'package:cart_bazar/features/authentication/data/models/user_sign_in.dart';
import 'package:cart_bazar/features/authentication/domain/usecase/signin_usecase.dart';
import 'package:cart_bazar/features/authentication/presentation/pages/sign_in/forgort_password.dart';
import 'package:cart_bazar/features/authentication/presentation/widgets/rich_text_button.dart';
import 'package:cart_bazar/features/authentication/presentation/widgets/text_field.dart';
import 'package:cart_bazar/features/home/home_presentation/home_screen.dart';
import 'package:cart_bazar/init_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/sign_in_headline_text.dart';

class EnterPasswordScreen extends StatelessWidget {
  final UserSignIn userSignIn;
  EnterPasswordScreen({
    super.key,
    required this.userSignIn,
  });

  final passWordController = TextEditingController();

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
            AppNavigator.pushReplacement(
              context,
              const HomeScreen(),
            );
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
                  text: 'Sign In',
                ),
                const SizedBox(height: 32),
                AuthTextField(
                  controller: passWordController,
                  hintText: 'Password',
                ),
                const SizedBox(height: 16),
                SubmitStateButton(
                  onPressed: () {
                    final password = passWordController.text.trim();
                    context.read<SubmitButtonCubit>().onButtonSubmit(
                        param: UserSignIn(userSignIn.email, password),
                        usecase: serviceLocator<SignInUsecase>());
                  },
                  title: 'Continue',
                ),
                const SizedBox(height: 16),
                RichTextButton(
                  richTextTitle: 'Forgot Password ? ',
                  spanTextTitle: 'Reset',
                  onTap: () {
                    AppNavigator.push(context, ForgortPassword());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
