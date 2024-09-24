import 'package:cart_bazar/core/usecase/use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';

part 'submit_button_state.dart';

class SubmitButtonCubit extends Cubit<SubimitButtonState> {
  SubmitButtonCubit() : super(SubmitButtonInitial());

  Future<void> onButtonSubmit({dynamic param, required UseCase usecase}) async {
    emit(SubmitButtonLoading());
    try {
      final Either createUser = await usecase.call(params: param);

      return createUser.fold(
        (error) => emit(SubmitButtonFailure(errorMessage: error)),
        (success) => emit(SubmitButtonSuccess()),
      );
    } catch (e) {
      return emit(SubmitButtonFailure(errorMessage: e.toString()));
    }
  }
}
