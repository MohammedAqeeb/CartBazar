part of 'submit_button_cubit.dart';

@immutable
sealed class SubimitButtonState {}

final class SubmitButtonInitial extends SubimitButtonState {}

final class SubmitButtonLoading extends SubimitButtonState {}

final class SubmitButtonSuccess extends SubimitButtonState {}

final class SubmitButtonFailure extends SubimitButtonState {}
