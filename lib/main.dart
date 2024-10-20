import 'dart:async';

import 'package:cart_bazar/core/common/cubit/submit_button/submit_button_cubit.dart';
import 'package:cart_bazar/core/theme/app_theme.dart';
import 'package:cart_bazar/features/authentication/presentation/bloc/cubit/selected_age_cubit.dart';
import 'package:cart_bazar/features/cart/presentation/cubit/product_cart_cubit.dart';
import 'package:cart_bazar/features/home/presentation/bloc/cubit/get_user_info_cubit.dart';
import 'package:cart_bazar/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:cart_bazar/features/splash/presentation/pages/screen.dart';
import 'package:cart_bazar/firebase_options.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/authentication/presentation/bloc/cubit/gender_selecion_cubit.dart';
import 'features/authentication/presentation/bloc/cubit/get_age_cubit.dart';
import 'init_dependency.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initalizedDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SplashCubit()..onAppStarted(),
        ),
        BlocProvider(
          create: (_) => serviceLocator<GetAgeCubit>(),
        ),
        BlocProvider(
          create: (context) => GenderSelecionCubit(),
        ),
        BlocProvider(
          create: (context) => SelectedAgeCubit(),
        ),
        BlocProvider(
          create: (context) => SubmitButtonCubit(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<GetUserInfoCubit>(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<ProductCartCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Cart Bazar',
        theme: AppTheme.themeData,
        home: const SplashScreen(),
      ),
    );
  }
}
