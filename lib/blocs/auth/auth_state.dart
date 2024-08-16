part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable {
  final GlobalKey<FormState> formKey;

  const AuthState({required this.formKey});

  @override
  List<Object?> get props => [formKey];
}

final class AuthenticatedState extends AuthState {
  const AuthenticatedState({required super.formKey});
}

final class UnauthenticatedState extends AuthState {
  final String password;

  const UnauthenticatedState({this.password = '', required super.formKey});

  UnauthenticatedState copyWith({
    String? password,
    GlobalKey<FormState>? formKey,
  }) =>
      UnauthenticatedState(
        password: password ?? this.password,
        formKey: formKey ?? this.formKey,
      );

  @override
  List<Object?> get props => [password, formKey];
}

final class LoginLoadingState extends UnauthenticatedState {
  const LoginLoadingState({
    super.password,
    required super.formKey,
  });
}

final class LoginFailureState extends UnauthenticatedState {
  final String message;

  const LoginFailureState({
    required this.message,
    super.password,
    required super.formKey,
  });

  @override
  List<Object?> get props => [message, password, formKey];
}
