import 'package:cart_bazar/features/authentication/domain/entity/user_info.dart';
import 'package:cart_bazar/features/authentication/domain/usecase/get_user_info_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_user_info_state.dart';

class GetUserInfoCubit extends Cubit<GetUserInfoState> {
  final GetUserInfoUsecase _getUserInfoUsecase;
  GetUserInfoCubit({
    required GetUserInfoUsecase getUserInfoUsecase,
  })  : _getUserInfoUsecase = getUserInfoUsecase,
        super(GetUserInfoLoading());

  Future<void> getUserDetails() async {
    final userData = await _getUserInfoUsecase.call();

    return userData.fold(
      (error) => emit(GetUserInfoFailure(message: error.errorMessage)),
      (entity) => emit(GetUserInfoSuccess(userInfoEnity: entity)),
    );
  }
}
