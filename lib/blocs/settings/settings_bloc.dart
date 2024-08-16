import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kafaa_app/repos/auth_repo.dart';
import 'package:kafaa_app/utils/constants.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final AuthRepo authRepo;

  SettingsBloc({required this.authRepo}) : super(const InitialState()) {
    on<GetDataEvent>((event, emit) async {
      emit(const GetDataLoadingState());
      try {
        JsonMap data = await authRepo.getManagerDetails();
        emit(GetDataLoadedState(
          formKey: GlobalKey<FormState>(),
          name: data['name'],
          lastLogin: data['last'],
        ));
      } catch (e) {
        emit(GetDataFailureState(message: e.toString()));
      }
    });

    on<ChangePasswordEvent>((event, emit) async {
      final state = this.state;
      if (state is GetDataLoadedState &&
          state.formKey.currentState!.validate()) {
        emit(ChangePasswordLoadingState(
          formKey: state.formKey,
          name: state.name,
          lastLogin: state.lastLogin,
          oldPassword: state.oldPassword,
          newPassword: state.newPassword,
        ));
        try {
          bool isChanged = await authRepo.changePassword(
            oldPassword: state.oldPassword,
            newPassword: state.newPassword,
          );
          isChanged
              ? emit(ChangePasswordSuccessState(
                  formKey: state.formKey,
                  name: state.name,
                  lastLogin: state.lastLogin,
                  oldPassword: state.oldPassword,
                  newPassword: state.newPassword,
                  message: '',
                ))
              : emit(ChangePasswordFailureState(
                  formKey: state.formKey,
                  name: state.name,
                  lastLogin: state.lastLogin,
                  oldPassword: state.oldPassword,
                  newPassword: state.newPassword,
                  message: '',
                ));
        } catch (e) {
          emit(ChangePasswordFailureState(
            formKey: state.formKey,
            name: state.name,
            lastLogin: state.lastLogin,
            oldPassword: state.oldPassword,
            newPassword: state.newPassword,
            message: '',
          ));
        }
      }
    });

    on<ChangeOldPasswordEvent>((event, emit) async {
      final state = this.state;
      if (state is GetDataLoadedState)
        emit(state.copyWith(oldPassword: event.password));
    });

    on<ChangeNewPasswordEvent>((event, emit) async {
      final state = this.state;
      if (state is GetDataLoadedState)
        emit(state.copyWith(newPassword: event.password));
    });
  }
}
