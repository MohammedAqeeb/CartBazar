part of 'get_age_cubit.dart';

@immutable
sealed class GetAgeState {}

final class GetAgeListSuccess extends GetAgeState {
  final List<AgeRange> ages;

  GetAgeListSuccess({required this.ages});
}

final class GetAgeLoading extends GetAgeState {}

final class GetAgeFailure extends GetAgeState {
  final String errorMessage;

  GetAgeFailure({required this.errorMessage});
}
