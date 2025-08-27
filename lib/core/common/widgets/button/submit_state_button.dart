import 'package:cart_bazar/core/common/cubit/submit_button/submit_button_cubit.dart';
import 'package:cart_bazar/core/theme/app_palletes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmitStateButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Widget? content;
  final double? height;
  final double? width;

  const SubmitStateButton({
    required this.onPressed,
    this.title = '',
    this.height,
    this.width,
    this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubmitButtonCubit, SubimitButtonState>(
      builder: (context, state) {
        if (state is SubmitButtonLoading) {
          return buildLoadingState(context);
        } else {
          return buildInitialState(context);
        }
      },
    );
  }

  Widget buildInitialState(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
          width ?? MediaQuery.of(context).size.width,
          height ?? 50,
        ),
      ),
      child: content ??
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
    );
  }

  Widget buildLoadingState(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {},
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
          width ?? MediaQuery.of(context).size.width,
          height ?? 50,
        ),
      ),
      child: const CircularProgressIndicator(
        backgroundColor: AppPalettes.hintTextColor,
      ),
    );
  }
}
