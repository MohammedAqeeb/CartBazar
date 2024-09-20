import 'package:cart_bazar/features/authentication/data/models/age_range.dart';
import 'package:cart_bazar/features/authentication/domain/usecase/age_range_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_age_state.dart';

class GetAgeCubit extends Cubit<GetAgeState> {
  final AgeRangeUseCase _useCase;
  GetAgeCubit({
    required AgeRangeUseCase ageUseCase,
  })  : _useCase = ageUseCase,
        super(GetAgeLoading());

  Future<void> listOfAgesDataFromFirebase() async {
    final ageList = await _useCase.call();

    ageList.fold(
      (error) => emit(GetAgeFailure(errorMessage: error)),
      (ages) => emit(GetAgeListSuccess(ages: ages)),
    );
  }
}
