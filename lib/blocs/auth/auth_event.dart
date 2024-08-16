part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class OpenAppEvent extends AuthEvent {}

final class LoggedInEvent extends AuthEvent {}

final class LoggedOutEvent extends AuthEvent {}

final class ChangePasswordEvent extends AuthEvent {
  final String password;

  ChangePasswordEvent({required this.password});
}

final class _ChangeStatusEvent extends AuthEvent {
  final bool status;

  _ChangeStatusEvent(this.status);
}
