import 'package:cart_bazar/core/common/navigator/app_navigator.dart';
import 'package:cart_bazar/core/common/widgets/custom_appbar.dart';
import 'package:cart_bazar/features/settings/presentation/widgets/favorites_screen.dart';

import 'package:flutter/material.dart';

import 'widgets/settings_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SettingsButton(
              buttonName: 'Favorites',
              onTap: () {
                AppNavigator.push(context, const FavoritesScreen());
              },
            ),
            SettingsButton(
              buttonName: 'My Address',
              onTap: () {},
            ),
            SettingsButton(
              buttonName: 'Payment',
              onTap: () {},
            ),
            SettingsButton(
              buttonName: 'Help',
              onTap: () {},
            ),
            SettingsButton(
              buttonName: 'Support',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
