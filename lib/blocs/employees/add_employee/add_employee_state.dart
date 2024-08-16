part of 'add_employee_bloc.dart';

sealed class AddEmployeeState extends Equatable {
  final EmployeeModel employee;
  final GlobalKey<FormState> formKey;

  const AddEmployeeState({
    this.employee = const EmployeeModel(),
    required this.formKey,
  });

  @override
  List<Object> get props => [employee, formKey];
}

final class InitialState extends AddEmployeeState {
  const InitialState({
    super.employee,
    required super.formKey,
  });
}

final class WriteState extends AddEmployeeState {
  const WriteState({
    required super.employee,
    required super.formKey,
  });
}

final class AddState extends AddEmployeeState {
  const AddState({
    required super.employee,
    required super.formKey,
  });
}
