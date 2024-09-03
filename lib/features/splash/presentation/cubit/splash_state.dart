part of 'splash_cubit.dart';

@immutable
sealed class SplashState {}

final class ShowSplash extends SplashState {}

final class UserAuthenticated extends SplashState {}

final class UnAuthenticatedUser extends SplashState {}
