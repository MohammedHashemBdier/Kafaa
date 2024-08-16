part of 'settings_bloc.dart';

sealed class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object?> get props => [];
}

final class InitialState extends SettingsState {
  const InitialState();
}

final class GetDataLoadingState extends SettingsState {
  const GetDataLoadingState();
}

final class GetDataFailureState extends SettingsState {
  final String message;

  const GetDataFailureState({required this.message});

  @override
  List<Object?> get props => [message];
}

final class GetDataLoadedState extends SettingsState {
  final GlobalKey<FormState> formKey;
  final String name;
  final String lastLogin;
  final String oldPassword;
  final String newPassword;

  const GetDataLoadedState({
    required this.formKey,
    required this.name,
    required this.lastLogin,
    this.oldPassword = '',
    this.newPassword = '',
  });

  GetDataLoadedState copyWith({
    GlobalKey<FormState>? formKey,
    String? name,
    String? lastLogin,
    String? oldPassword,
    String? newPassword,
  }) =>
      GetDataLoadedState(
        formKey: formKey ?? this.formKey,
        name: name ?? this.name,
        lastLogin: lastLogin ?? this.lastLogin,
        oldPassword: oldPassword ?? this.oldPassword,
        newPassword: newPassword ?? this.newPassword,
      );

  @override
  List<Object?> get props => [
        formKey,
        name,
        lastLogin,
        oldPassword,
        newPassword,
      ];
}

final class ChangePasswordLoadingState extends GetDataLoadedState {
  const ChangePasswordLoadingState({
    required super.formKey,
    required super.name,
    required super.lastLogin,
    required super.oldPassword,
    required super.newPassword,
  });
}

final class ChangePasswordFailureState extends GetDataLoadedState {
  final String message;

  const ChangePasswordFailureState({
    required super.formKey,
    required super.name,
    required super.lastLogin,
    required super.oldPassword,
    required super.newPassword,
    required this.message,
  });

  @override
  GetDataLoadedState copyWith({
    GlobalKey<FormState>? formKey,
    String? name,
    String? lastLogin,
    String? oldPassword,
    String? newPassword,
  }) =>
      GetDataLoadedState(
        formKey: formKey ?? this.formKey,
        name: name ?? this.name,
        lastLogin: lastLogin ?? this.lastLogin,
        oldPassword: oldPassword ?? this.oldPassword,
        newPassword: newPassword ?? this.newPassword,
      );

  @override
  List<Object?> get props => [
        formKey,
        name,
        lastLogin,
        oldPassword,
        newPassword,
        message,
      ];
}

final class ChangePasswordSuccessState extends GetDataLoadedState {
  final String message;

  const ChangePasswordSuccessState({
    required super.formKey,
    required super.name,
    required super.lastLogin,
    required super.oldPassword,
    required super.newPassword,
    required this.message,
  });

  @override
  GetDataLoadedState copyWith({
    GlobalKey<FormState>? formKey,
    String? name,
    String? lastLogin,
    String? oldPassword,
    String? newPassword,
  }) =>
      GetDataLoadedState(
        formKey: formKey ?? this.formKey,
        name: name ?? this.name,
        lastLogin: lastLogin ?? this.lastLogin,
        oldPassword: oldPassword ?? this.oldPassword,
        newPassword: newPassword ?? this.newPassword,
      );

  @override
  List<Object?> get props => [
        formKey,
        name,
        lastLogin,
        oldPassword,
        newPassword,
        message,
      ];
}
