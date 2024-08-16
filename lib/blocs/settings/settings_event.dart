part of 'settings_bloc.dart';

sealed class SettingsEvent {}

class GetDataEvent extends SettingsEvent {}

class ChangePasswordEvent extends SettingsEvent {}

class ChangeOldPasswordEvent extends SettingsEvent {
  final String? password;

  ChangeOldPasswordEvent({required this.password});
}

class ChangeNewPasswordEvent extends SettingsEvent {
  final String? password;

  ChangeNewPasswordEvent({required this.password});
}
