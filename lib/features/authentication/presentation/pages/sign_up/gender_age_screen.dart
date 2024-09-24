import 'package:cart_bazar/core/common/app_bottom_sheet/select_age.dart';
import 'package:cart_bazar/core/common/cubit/submit_button/submit_button_cubit.dart';
import 'package:cart_bazar/core/common/widgets/button/submit_state_button.dart';
import 'package:cart_bazar/core/common/widgets/custom_appbar.dart';
import 'package:cart_bazar/core/theme/app_palletes.dart';
import 'package:cart_bazar/features/authentication/data/models/board_user.dart';
import 'package:cart_bazar/features/authentication/domain/usecase/signup_usecase.dart';
import 'package:cart_bazar/features/authentication/presentation/bloc/cubit/gender_selecion_cubit.dart';
import 'package:cart_bazar/features/authentication/presentation/bloc/cubit/get_age_cubit.dart';
import 'package:cart_bazar/features/authentication/presentation/bloc/cubit/selected_age_cubit.dart';
import 'package:cart_bazar/features/authentication/presentation/widgets/sign_in_headline_text.dart';
import 'package:cart_bazar/init_dependency.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/select_age.dart';

class SignUpGenderAgeScreen extends StatelessWidget {
  final OnBoardUser onBoardUser;

  const SignUpGenderAgeScreen({
    super.key,
    required this.onBoardUser,
  });

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
          }
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const SignInHeadlineText(
                    text: 'Tell us About Yourself',
                    fontSize: 18,
                  ),
                  const SizedBox(height: 20),
                  buildSelectionGender(context),
                  const SizedBox(height: 30),
                  const SignInHeadlineText(
                    text: 'How old are you',
                    fontSize: 18,
                  ),
                  const SizedBox(height: 30),
                  buildAgeSelector(context),
                ],
              ),
            ),
            const Spacer(),
            buildButton(context),
          ],
        ),
      ),
    );
  }

  Widget buildSelectionGender(BuildContext context) {
    return BlocBuilder<GenderSelecionCubit, int>(
      builder: (context, state) {
        return Row(
          children: [
            buildGenderButtons(text: 'Male', context: context, genderIndex: 1),
            const SizedBox(width: 20),
            buildGenderButtons(
                text: 'Female', context: context, genderIndex: 2),
          ],
        );
      },
    );
  }

  Widget buildGenderButtons({
    required String text,
    required BuildContext context,
    required int genderIndex,
  }) {
    final index = context.read<GenderSelecionCubit>();
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          index.selectedIndex(genderIndex);
        },
        child: Container(
          alignment: Alignment.center,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: index.defaultIndex == genderIndex
                ? AppPalletes.primary
                : AppPalletes.secondBackground,
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAgeSelector(BuildContext context) {
    return BlocBuilder<SelectedAgeCubit, String>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => AppBottomSheet.selectAge(
            context: context,
            widgets: MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: context.read<GetAgeCubit>()
                    ..listOfAgesDataFromFirebase(),
                ),
                BlocProvider.value(value: context.read<SelectedAgeCubit>()),
              ],
              child: const SelectAgeBottomSheet(),
            ),
          ),
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppPalletes.secondBackground,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  state,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Icon(Icons.arrow_drop_down)
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      alignment: Alignment.center,
      height: 100,
      decoration: const BoxDecoration(color: AppPalletes.secondBackground),
      child: SubmitStateButton(
        onPressed: () {
          onBoardUser.age = context.read<SelectedAgeCubit>().defaultAge;
          onBoardUser.gender =
              context.read<GenderSelecionCubit>().defaultIndex == 1
                  ? 'MALE'
                  : 'FEMALE';

          context.read<SubmitButtonCubit>().onButtonSubmit(
                usecase: serviceLocator<SignupUseCase>(),
                param: onBoardUser,
              );
        },
        title: "Finish",
      ),
    );
  }
}
