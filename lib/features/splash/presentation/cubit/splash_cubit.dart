import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(ShowSplash());

  void onAppStarted() async {
    await Future.delayed(const Duration(seconds: 1));
    emit(UnAuthenticatedUser());
  }
}
