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

class ChangeAddEmployeeName extends EmployeesEvent {
  final String? name;

  ChangeAddEmployeeName({required this.name});
}

class ChangeAddEmployeeUsername extends EmployeesEvent {
  final String? username;

  ChangeAddEmployeeUsername({required this.username});
}

class ChangeAddEmployeePassword extends EmployeesEvent {
  final String? password;

  ChangeAddEmployeePassword({required this.password});
}

class ChangeAddEmployeeDepartment extends EmployeesEvent {
  final String? department;

  ChangeAddEmployeeDepartment({required this.department});
}

class ChangeAddEmployeePhoneNumber extends EmployeesEvent {
  final String? phoneNumber;

  ChangeAddEmployeePhoneNumber({required this.phoneNumber});
}

class ChangeAddEmployeeMobileNumber extends EmployeesEvent {
  final String? mobileNumber;

  ChangeAddEmployeeMobileNumber({required this.mobileNumber});
}

class ChangeAddEmployeeIsWork extends EmployeesEvent {
  final bool? isWork;

  ChangeAddEmployeeIsWork({required this.isWork});
}

class ChangeAddEmployeeDateOfJoining extends EmployeesEvent {
  final DateTime? dateOfJoining;

  ChangeAddEmployeeDateOfJoining({required this.dateOfJoining});
}

class ChangeAddEmployeeIDNumber extends EmployeesEvent {
  final String? idNumber;

  ChangeAddEmployeeIDNumber({required this.idNumber});
}

class ChangeAddEmployeeAddress extends EmployeesEvent {
  final String? address;

  ChangeAddEmployeeAddress({required this.address});
}

class ChangeAddEmployeeDateOfBirth extends EmployeesEvent {
  final DateTime? dateOfBirth;

  ChangeAddEmployeeDateOfBirth({required this.dateOfBirth});
}

class ChangeAddEmployeeAcademicSpecialization extends EmployeesEvent {
  final String? academicSpecialization;

  ChangeAddEmployeeAcademicSpecialization(
      {required this.academicSpecialization});
}
