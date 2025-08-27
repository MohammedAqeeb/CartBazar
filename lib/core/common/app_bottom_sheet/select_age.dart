import 'package:cart_bazar/core/theme/app_palletes.dart';
import 'package:flutter/material.dart';

class AppBottomSheet {
  static Future<void> getSheet({
    required BuildContext context,
    required Widget widgets,
  }) {
    return showModalBottomSheet(
      backgroundColor: AppPalettes.secondBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      context: context,
      builder: (_) => widgets,
    );
  }
}
