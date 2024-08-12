import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kafaa_app/models/employee_model.dart';

part 'show_edit_employee_event.dart';
part 'show_edit_employee_state.dart';

class ShowEditEmployeeBloc
    extends Bloc<ShowEditEmployeeEvent, ShowEditEmployeeState> {
  ShowEditEmployeeBloc() : super(InitialState()) {
    on<GetEmployeeEvent>((event, emit) {
      emit(ShowInfoState(employee: event.employee));
    });

    on<DeleteEvent>((event, emit) {
      emit(DeleteState());
    });

    on<EnableDisableEditingEvent>((event, emit) {
      final state = this.state;
      if (state is ShowInfoState)
        emit(ShowInfoState(
          employee: state.employee,
          isEditingEnabled: !state.isEditingEnabled,
        ));
    });

    on<SaveEvent>((event, emit) {
      final state = this.state;
      if (state is ShowInfoState)
        emit(SaveState(
          employee: state.employee,
          isEditingEnabled: !state.isEditingEnabled,
        ));
    });

    on<ChangeEmployeeName>((event, emit) {
      final state = this.state;
      if (state is ShowInfoState)
        emit(
          state.copyWith(
            employee: state.employee.copyWith(name: () => event.name),
          ),
        );
    });

    on<ChangeEmployeeUsername>((event, emit) {
      final state = this.state;
      if (state is ShowInfoState)
        emit(
          state.copyWith(
            employee: state.employee.copyWith(username: () => event.username),
          ),
        );
    });

    on<ChangeEmployeePassword>((event, emit) {
      final state = this.state;
      if (state is ShowInfoState)
        emit(
          state.copyWith(
            employee: state.employee.copyWith(password: () => event.password),
          ),
        );
    });

    on<ChangeEmployeeDepartment>((event, emit) {
      final state = this.state;
      if (state is ShowInfoState)
        emit(
          state.copyWith(
            employee:
                state.employee.copyWith(department: () => event.department),
          ),
        );
    });

    on<ChangeEmployeePhoneNumber>((event, emit) {
      final state = this.state;
      if (state is ShowInfoState)
        emit(
          state.copyWith(
            employee:
                state.employee.copyWith(phoneNumber: () => event.phoneNumber),
          ),
        );
    });

    on<ChangeEmployeeMobileNumber>((event, emit) {
      final state = this.state;
      if (state is ShowInfoState)
        emit(
          state.copyWith(
            employee:
                state.employee.copyWith(mobileNumber: () => event.mobileNumber),
          ),
        );
    });

    on<ChangeEmployeeIsWork>((event, emit) {
      final state = this.state;
      if (state is ShowInfoState)
        emit(
          state.copyWith(
            employee: state.employee.copyWith(isWork: () => event.isWork),
          ),
        );
    });

    on<ChangeEmployeeDateOfJoining>((event, emit) {
      final state = this.state;
      if (state is ShowInfoState)
        emit(
          state.copyWith(
            employee: state.employee
                .copyWith(dateOfJoining: () => event.dateOfJoining),
          ),
        );
    });

    on<ChangeEmployeeIDNumber>((event, emit) {
      final state = this.state;
      if (state is ShowInfoState)
        emit(
          state.copyWith(
            employee: state.employee.copyWith(idNumber: () => event.idNumber),
          ),
        );
    });

    on<ChangeEmployeeAddress>((event, emit) {
      final state = this.state;
      if (state is ShowInfoState)
        emit(
          state.copyWith(
            employee: state.employee.copyWith(address: () => event.address),
          ),
        );
    });

    on<ChangeEmployeeDateOfBirth>((event, emit) {
      final state = this.state;
      if (state is ShowInfoState)
        emit(
          state.copyWith(
            employee:
                state.employee.copyWith(dateOfBirth: () => event.dateOfBirth),
          ),
        );
    });

    on<ChangeEmployeeAcademicSpecialization>((event, emit) {
      final state = this.state;
      if (state is ShowInfoState)
        emit(
          state.copyWith(
            employee: state.employee.copyWith(
                academicSpecialization: () => event.academicSpecialization),
          ),
        );
    });
  }
}
