import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kafaa_app/models/employee_model.dart';
import 'package:kafaa_app/repos/auth_repo.dart';
import 'package:kafaa_app/repos/employees_repo.dart';
import 'package:kafaa_app/utils/api_exceptions.dart';

part 'employees_event.dart';
part 'employees_state.dart';

class EmployeesBloc extends Bloc<EmployeesEvent, EmployeesState> {
  final EmployeesRepo employeesRepo;
  final AuthRepo authRepo;

  EmployeesBloc({required this.employeesRepo, required this.authRepo})
      : super(const InitialState()) {
    on<GetEmployeesEvent>((event, emit) async {
      if (event is SearchOnEmployeesEvent)
        emit(state.copyWith(searchOnEmployeesText: event.employeeName));

      emit(GetEmployeesLoadingState(
          searchOnEmployeesText: state.searchOnEmployeesText));

      try {
        List<EmployeeModel> employees = await employeesRepo.getEmployees(
          password: authRepo.password,
          search: event is SearchOnEmployeesEvent ? event.employeeName : null,
        );

        emit(GetEmployeesLoadedState(
          searchOnEmployeesText: state.searchOnEmployeesText,
          employees: employees,
        ));
      } on UnauthorizedException {
        authRepo.logout();
      } on ForbiddenException {
        authRepo.logout();
      } catch (e) {
        emit(GetEmployeesFailureState(
          searchOnEmployeesText: state.searchOnEmployeesText,
          message: e.toString(),
        ));
      }
    });

    on<AddEmployeeEvent>((event, emit) async {
      final state = this.state;

      if (state is GetEmployeesLoadedState) {
        List<EmployeeModel> oldEmployees =
            List<EmployeeModel>.from(state.employees);

        List<EmployeeModel> newEmployees =
            List<EmployeeModel>.from(state.employees);

        if (event.employee.name!.contains(state.searchOnEmployeesText))
          newEmployees.add(event.employee);

        emit(state.copyWith(employees: newEmployees));

        try {
          bool isAdded = await employeesRepo.addEmployee(
            password: authRepo.password,
            employee: event.employee,
          );

          if (!isAdded) emit(state.copyWith(employees: oldEmployees));
        } on UnauthorizedException {
          authRepo.logout();
        } on ForbiddenException {
          authRepo.logout();
        } catch (e) {
          emit(state.copyWith(employees: oldEmployees));
        }
      }
    });

    on<EditEmployeeEvent>((event, emit) async {
      final state = this.state;

      if (state is GetEmployeesLoadedState) {
        List<EmployeeModel> oldEmployees =
            List<EmployeeModel>.from(state.employees);

        List<EmployeeModel> newEmployees = state.employees
            .map((employee) =>
                employee.id == event.employee.id ? event.employee : employee)
            .toList();

        if (!event.employee.name!.contains(state.searchOnEmployeesText))
          newEmployees.remove(event.employee);

        emit(state.copyWith(employees: newEmployees));

        try {
          bool isEdited = await employeesRepo.editEmployee(
            password: authRepo.password,
            employee: event.employee,
          );

          if (!isEdited) emit(state.copyWith(employees: oldEmployees));
        } on UnauthorizedException {
          authRepo.logout();
        } on ForbiddenException {
          authRepo.logout();
        } catch (e) {
          emit(state.copyWith(employees: oldEmployees));
        }
      }
    });

    on<DeleteEmployeeEvent>((event, emit) async {
      final state = this.state;

      if (state is GetEmployeesLoadedState) {
        List<EmployeeModel> oldEmployees =
            List<EmployeeModel>.from(state.employees);

        List<EmployeeModel> newEmployees = state.employees
            .where((employee) => event.employee != employee)
            .toList();

        emit(state.copyWith(employees: newEmployees));

        try {
          bool isDeleted = await employeesRepo.deleteEmployee(
            password: authRepo.password,
            employee: event.employee,
          );

          if (!isDeleted) emit(state.copyWith(employees: oldEmployees));
        } on UnauthorizedException {
          authRepo.logout();
        } on ForbiddenException {
          authRepo.logout();
        } catch (e) {
          emit(state.copyWith(employees: oldEmployees));
        }
      }
    });
  }
}
