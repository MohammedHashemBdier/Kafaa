import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kafaa_app/models/employee_model.dart';

part 'add_employee_event.dart';
part 'add_employee_state.dart';

class AddEmployeeBloc extends Bloc<AddEmployeeEvent, AddEmployeeState> {
  AddEmployeeBloc() : super(const InitialState()) {
    on<AddEvent>((event, emit) {
      emit(AddState(employee: state.employee));
      emit(const InitialState());
    });

    on<ChangeEmployeeName>((event, emit) {
      emit(
        WriteState(
          employee: state.employee.copyWith(name: () => event.name),
        ),
      );
    });

    on<ChangeEmployeeUsername>((event, emit) {
      emit(
        WriteState(
          employee: state.employee.copyWith(username: () => event.username),
        ),
      );
    });

    on<ChangeEmployeePassword>((event, emit) {
      emit(
        WriteState(
          employee: state.employee.copyWith(password: () => event.password),
        ),
      );
    });

    on<ChangeEmployeeDepartment>((event, emit) {
      emit(
        WriteState(
          employee: state.employee.copyWith(department: () => event.department),
        ),
      );
    });

    on<ChangeEmployeePhoneNumber>((event, emit) {
      emit(
        WriteState(
          employee:
              state.employee.copyWith(phoneNumber: () => event.phoneNumber),
        ),
      );
    });

    on<ChangeEmployeeMobileNumber>((event, emit) {
      emit(
        WriteState(
          employee:
              state.employee.copyWith(mobileNumber: () => event.mobileNumber),
        ),
      );
    });

    on<ChangeEmployeeIsWork>((event, emit) {
      emit(
        WriteState(
          employee: state.employee.copyWith(isWork: () => event.isWork),
        ),
      );
    });

    on<ChangeEmployeeDateOfJoining>((event, emit) {
      emit(
        WriteState(
          employee:
              state.employee.copyWith(dateOfJoining: () => event.dateOfJoining),
        ),
      );
    });

    on<ChangeEmployeeIDNumber>((event, emit) {
      emit(
        WriteState(
          employee: state.employee.copyWith(idNumber: () => event.idNumber),
        ),
      );
    });

    on<ChangeEmployeeAddress>((event, emit) {
      emit(
        WriteState(
          employee: state.employee.copyWith(address: () => event.address),
        ),
      );
    });

    on<ChangeEmployeeDateOfBirth>((event, emit) {
      emit(
        WriteState(
          employee:
              state.employee.copyWith(dateOfBirth: () => event.dateOfBirth),
        ),
      );
    });

    on<ChangeEmployeeAcademicSpecialization>((event, emit) {
      emit(
        WriteState(
          employee: state.employee.copyWith(
              academicSpecialization: () => event.academicSpecialization),
        ),
      );
    });
  }
}
