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
        addEmployee: state.addEmployee,
        searchOnEmployeesText: state.searchOnEmployeesText,
      ));

      try {
        List<EmployeeModel> employees = await employeesRepo.getEmployees(
          password: '12345678',
          search: event is SearchOnEmployeesEvent ? event.employeeName : null,
        );

        emit(GetEmployeesLoadedState(
          addEmployee: state.addEmployee,
          searchOnEmployeesText: state.searchOnEmployeesText,
          employees: employees,
        ));
      } on UnauthorizedException {
        // authRepo.logout();
      } on ForbiddenException {
        // authRepo.logout();
      } catch (e) {
        emit(GetEmployeesFailureState(
          addEmployee: state.addEmployee,
          searchOnEmployeesText: state.searchOnEmployeesText,
          message: e.toString(),
        ));
      }
    });

    on<AddEmployeeEvent>((event, emit) {

    });

    on<EditEmployeeEvent>((event, emit) {});

    on<DeleteEmployeeEvent>((event, emit) {});

    on<ChangeAddEmployeeName>((event, emit) {
      emit(
        state.copyWith(
          addEmployee: state.addEmployee.copyWith(name: () => event.name),
        ),
      );
    });
  }
}
