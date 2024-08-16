import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafaa_app/repos/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;

  AuthBloc({required this.authRepo})
      : super(UnauthenticatedState(formKey: GlobalKey<FormState>())) {
    on<OpenAppEvent>((event, emit) {
      authRepo.isAuthenticated.listen(
        (status) => add(_ChangeStatusEvent(status)),
      );
    });

    on<LoggedInEvent>((event, emit) async {
      final state = this.state;
      if (state is UnauthenticatedState &&
          state.formKey.currentState!.validate()) {
        emit(LoginLoadingState(
          password: state.password,
          formKey: state.formKey,
        ));
        try {
          await authRepo.login(state.password);
        } catch (e) {
          emit(LoginFailureState(
            message: e.toString(),
            password: state.password,
            formKey: state.formKey,
          ));
        }
      }
    });

    on<LoggedOutEvent>((event, emit) {
      authRepo.logout();
    });

    on<ChangePasswordEvent>((event, emit) {
      final state = this.state;
      if (state is UnauthenticatedState)
        emit(state.copyWith(password: event.password));
    });

    on<_ChangeStatusEvent>((event, emit) {
      event.status
          ? emit(AuthenticatedState(formKey: state.formKey))
          : emit(UnauthenticatedState(formKey: state.formKey));
    });
  }
}
