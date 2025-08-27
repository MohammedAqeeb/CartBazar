import 'package:cart_bazar/core/assets/app_images.dart';
import 'package:cart_bazar/core/assets/app_vector.dart';
import 'package:cart_bazar/core/theme/app_palletes.dart';
import 'package:cart_bazar/features/authentication/domain/entity/user_info.dart';
import 'package:cart_bazar/features/home/presentation/bloc/cubit/get_user_info_cubit.dart';
import 'package:cart_bazar/init_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/common/navigator/app_navigator.dart';
import '../../../cart/presentation/pages/cart_page.dart';
import '../../../settings/presentation/pages/settings.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<GetUserInfoCubit>()..getUserDetails(),
      child: Padding(
        padding: const EdgeInsets.only(top: 50, right: 16, left: 16),
        child: BlocBuilder<GetUserInfoCubit, GetUserInfoState>(
          builder: (context, state) {
            if (state is GetUserInfoLoading) {
              return buildShimmers();
            } else if (state is GetUserInfoFailure) {
              return Center(
                child: Text(state.message),
              );
            } else if (state is GetUserInfoSuccess) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _profileImage(state.userInfoEnity, context),
                  _gender(state.userInfoEnity),
                  _card(context)
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }

  Row buildShimmers() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (var i = 0; i < 3; i++)
          Shimmer.fromColors(
            baseColor: AppPalettes.hintTextColor,
            highlightColor: Colors.white,
            child: Container(
              width: 80,
              height: 50,
              decoration: const BoxDecoration(
                color: AppPalettes.offWhite,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
}

Widget _profileImage(UserInfoEnity userInfoEnity, BuildContext context) {
  return GestureDetector(
    onTap: () {
      AppNavigator.push(context, const SettingsScreen());
    },
    child: Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        image: DecorationImage(
          // image: user.image.isEmpty?
          image: AssetImage(AppImages.profile),
          // : NetworkImage(user.image)),
          // color: Colors.red,
          // shape: BoxShape.circle,
        ),
      ),
    ),
  );
}

Widget _gender(UserInfoEnity userInfoEnity) {
  return Container(
    height: 40,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: AppPalettes.secondBackground,
      borderRadius: BorderRadius.circular(100),
    ),
    child: Center(
      child: Text(
        userInfoEnity.gender,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    ),
  );
}

Widget _card(BuildContext context) {
  return GestureDetector(
    onTap: () {
      AppNavigator.push(context, const CartPage());
    },
    child: Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        color: AppPalettes.primary,
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        AppVector.bag,
        fit: BoxFit.none,
      ),
    ),
  );
}
