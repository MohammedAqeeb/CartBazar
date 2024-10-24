import 'package:cart_bazar/core/theme/app_palletes.dart';
import 'package:flutter/material.dart';

import '../../../../core/assets/app_images.dart';

class SettingsButton extends StatelessWidget {
  final String buttonName;
  final Function()? onTap;
  const SettingsButton({
    super.key,
    required this.buttonName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 10,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
            color: AppPalletes.secondBackground,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                buttonName,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Image.asset(AppImages.arrowLogo)
            ],
          ),
        ),
      ),
    );
  }
}
