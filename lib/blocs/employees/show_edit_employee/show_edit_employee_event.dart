part of 'show_edit_employee_bloc.dart';

sealed class ShowEditEmployeeEvent {}

class GetEmployeeEvent extends ShowEditEmployeeEvent {
  final EmployeeModel employee;

  GetEmployeeEvent({required this.employee});
}

class DeleteEmployeeEvent extends ShowEditEmployeeEvent {}

class SaveEvent extends ShowEditEmployeeEvent {}

class EnableDisableEditingEvent extends ShowEditEmployeeEvent {}

class ChangeEmployeeName extends ShowEditEmployeeEvent {
  final String? name;

  ChangeEmployeeName({required this.name});
}

class ChangeEmployeeUsername extends ShowEditEmployeeEvent {
  final String? username;

  ChangeEmployeeUsername({required this.username});
}

class ChangeEmployeePassword extends ShowEditEmployeeEvent {
  final String? password;

  ChangeEmployeePassword({required this.password});
}

class ChangeEmployeeDepartment extends ShowEditEmployeeEvent {
  final String? department;

  ChangeEmployeeDepartment({required this.department});
}

class ChangeEmployeePhoneNumber extends ShowEditEmployeeEvent {
  final String? phoneNumber;

  ChangeEmployeePhoneNumber({required this.phoneNumber});
}

class ChangeEmployeeMobileNumber extends ShowEditEmployeeEvent {
  final String? mobileNumber;

  ChangeEmployeeMobileNumber({required this.mobileNumber});
}

class ChangeEmployeeIsWork extends ShowEditEmployeeEvent {
  final bool? isWork;

  ChangeEmployeeIsWork({required this.isWork});
}

class ChangeEmployeeDateOfJoining extends ShowEditEmployeeEvent {
  final DateTime? dateOfJoining;

  ChangeEmployeeDateOfJoining({required this.dateOfJoining});
}

class ChangeEmployeeIDNumber extends ShowEditEmployeeEvent {
  final String? idNumber;

  ChangeEmployeeIDNumber({required this.idNumber});
}

class ChangeEmployeeAddress extends ShowEditEmployeeEvent {
  final String? address;

  ChangeEmployeeAddress({required this.address});
}

class ChangeEmployeeDateOfBirth extends ShowEditEmployeeEvent {
  final DateTime? dateOfBirth;

  ChangeEmployeeDateOfBirth({required this.dateOfBirth});
}

class ChangeEmployeeAcademicSpecialization extends ShowEditEmployeeEvent {
  final String? academicSpecialization;

  ChangeEmployeeAcademicSpecialization({required this.academicSpecialization});
}
