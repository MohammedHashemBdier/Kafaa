part of 'employees_bloc.dart';

sealed class EmployeesEvent {}

sealed class GetEmployeesEvent extends EmployeesEvent {}

class GetAllEmployeesEvent extends GetEmployeesEvent {}

class SearchOnEmployeesEvent extends GetEmployeesEvent {
  final String? employeeName;

  SearchOnEmployeesEvent({required this.employeeName});
}

class AddEmployeeEvent extends EmployeesEvent {
  final EmployeeModel employee;

  AddEmployeeEvent({required this.employee});
}

class EditEmployeeEvent extends EmployeesEvent {
  final EmployeeModel employee;

  EditEmployeeEvent({required this.employee});
}

class DeleteEmployeeEvent extends EmployeesEvent {
  final EmployeeModel employee;

  DeleteEmployeeEvent({required this.employee});
}