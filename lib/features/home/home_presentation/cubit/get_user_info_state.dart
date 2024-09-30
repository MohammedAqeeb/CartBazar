part of 'get_user_info_cubit.dart';

@immutable
sealed class GetUserInfoState {}

final class GetUserInfoSuccess extends GetUserInfoState {
  final UserInfoEnity userInfoEnity;

  GetUserInfoSuccess({required this.userInfoEnity});
}

final class GetUserInfoLoading extends GetUserInfoState {}

final class GetUserInfoFailure extends GetUserInfoState {
  final String message;

  GetUserInfoFailure({required this.message});
}
