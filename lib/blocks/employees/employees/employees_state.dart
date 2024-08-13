part of 'employees_bloc.dart';

sealed class EmployeesState extends Equatable {
  final String searchOnEmployeesText;

  const EmployeesState({
    this.searchOnEmployeesText = '',
  });

  EmployeesState copyWith({
    String? searchOnEmployeesText,
  });

  @override
  List<Object?> get props => [searchOnEmployeesText];
}

final class InitialState extends EmployeesState {
  const InitialState({
    super.searchOnEmployeesText,
  });

  @override
  InitialState copyWith({
    String? searchOnEmployeesText,
  }) =>
      InitialState(
        searchOnEmployeesText:
            searchOnEmployeesText ?? this.searchOnEmployeesText,
      );
}

final class GetEmployeesLoadingState extends EmployeesState {
  const GetEmployeesLoadingState({
    required super.searchOnEmployeesText,
  });

  @override
  GetEmployeesLoadingState copyWith({
    String? searchOnEmployeesText,
  }) =>
      GetEmployeesLoadingState(
        searchOnEmployeesText:
            searchOnEmployeesText ?? this.searchOnEmployeesText,
      );
}

final class GetEmployeesFailureState extends EmployeesState {
  final String message;

  const GetEmployeesFailureState({
    required super.searchOnEmployeesText,
    required this.message,
  });

  @override
  GetEmployeesFailureState copyWith({
    String? searchOnEmployeesText,
    String? message,
  }) =>
      GetEmployeesFailureState(
        searchOnEmployeesText:
            searchOnEmployeesText ?? this.searchOnEmployeesText,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [searchOnEmployeesText, message];
}

final class GetEmployeesLoadedState extends EmployeesState {
  final List<EmployeeModel> employees;

  const GetEmployeesLoadedState({
    required super.searchOnEmployeesText,
    required this.employees,
  });

  @override
  GetEmployeesLoadedState copyWith({
    String? searchOnEmployeesText,
    List<EmployeeModel>? employees,
  }) =>
      GetEmployeesLoadedState(
        searchOnEmployeesText:
            searchOnEmployeesText ?? this.searchOnEmployeesText,
        employees: employees ?? this.employees,
      );

  @override
  List<Object?> get props => [searchOnEmployeesText, employees];
}
