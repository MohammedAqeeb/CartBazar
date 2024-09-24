import 'package:cart_bazar/features/authentication/domain/usecase/logged_in_user_usecase.dart';
import 'package:cart_bazar/init_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(ShowSplash());

  void onAppStarted() async {
    await Future.delayed(const Duration(seconds: 1));
    final isUserLoggedIn = await serviceLocator<LoggedInUserUseCase>().call();
    if (isUserLoggedIn) {
      emit(UserAuthenticated());
    } else {
      emit(UnAuthenticatedUser());
    }
  }
}
