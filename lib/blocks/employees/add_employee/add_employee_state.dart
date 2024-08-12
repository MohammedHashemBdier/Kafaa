part of 'add_employee_bloc.dart';

sealed class AddEmployeeState extends Equatable {
  final EmployeeModel employee;

  const AddEmployeeState({this.employee = const EmployeeModel()});

  @override
  List<Object> get props => [employee];
}

final class InitialState extends AddEmployeeState {
  const InitialState({super.employee});
}

final class WriteState extends AddEmployeeState {
  const WriteState({required super.employee});
}

final class AddState extends AddEmployeeState {
  const AddState({required super.employee});
}