part of 'employees_bloc.dart';

sealed class EmployeesState extends Equatable {
  final EmployeeModel addEmployee;
  final String searchOnEmployeesText;

  const EmployeesState({
    this.addEmployee = const EmployeeModel(),
    this.searchOnEmployeesText = '',
  });

  EmployeesState copyWith({
    EmployeeModel? addEmployee,
    String? searchOnEmployeesText,
  });

  @override
  List<Object?> get props => [addEmployee, searchOnEmployeesText];
}

final class InitialState extends EmployeesState {
  const InitialState({
    super.addEmployee,
    super.searchOnEmployeesText,
  });

  @override
  InitialState copyWith({
    EmployeeModel? addEmployee,
    String? searchOnEmployeesText,
  }) =>
      InitialState(
        addEmployee: addEmployee ?? this.addEmployee,
        searchOnEmployeesText:
            searchOnEmployeesText ?? this.searchOnEmployeesText,
      );
}

final class GetEmployeesLoadingState extends EmployeesState {
  const GetEmployeesLoadingState({
    required super.addEmployee,
    required super.searchOnEmployeesText,
  });

  @override
  GetEmployeesLoadingState copyWith({
    EmployeeModel? addEmployee,
    String? searchOnEmployeesText,
  }) =>
      GetEmployeesLoadingState(
        addEmployee: addEmployee ?? this.addEmployee,
        searchOnEmployeesText:
            searchOnEmployeesText ?? this.searchOnEmployeesText,
      );
}

final class GetEmployeesFailureState extends EmployeesState {
  final String message;

  const GetEmployeesFailureState({
    required super.addEmployee,
    required super.searchOnEmployeesText,
    required this.message,
  });

  @override
  GetEmployeesFailureState copyWith({
    EmployeeModel? addEmployee,
    String? searchOnEmployeesText,
    String? message,
  }) =>
      GetEmployeesFailureState(
        addEmployee: addEmployee ?? this.addEmployee,
        searchOnEmployeesText:
            searchOnEmployeesText ?? this.searchOnEmployeesText,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [addEmployee, searchOnEmployeesText, message];
}

final class GetEmployeesLoadedState extends EmployeesState {
  final List<EmployeeModel> employees;

  const GetEmployeesLoadedState({
    required super.addEmployee,
    required super.searchOnEmployeesText,
    required this.employees,
  });

  @override
  GetEmployeesLoadedState copyWith({
    EmployeeModel? addEmployee,
    String? searchOnEmployeesText,
    List<EmployeeModel>? employees,
  }) =>
      GetEmployeesLoadedState(
        addEmployee: addEmployee ?? this.addEmployee,
        searchOnEmployeesText:
            searchOnEmployeesText ?? this.searchOnEmployeesText,
        employees: employees ?? this.employees,
      );

  @override
  List<Object?> get props => [addEmployee, searchOnEmployeesText, employees];
}
