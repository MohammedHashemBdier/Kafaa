part of 'add_employee_bloc.dart';

sealed class AddEmployeeEvent {}

class AddEvent extends AddEmployeeEvent {}

class ChangeEmployeeName extends AddEmployeeEvent {
  final String? name;

  ChangeEmployeeName({required this.name});
}

class ChangeEmployeeUsername extends AddEmployeeEvent {
  final String? username;

  ChangeEmployeeUsername({required this.username});
}

class ChangeEmployeePassword extends AddEmployeeEvent {
  final String? password;

  ChangeEmployeePassword({required this.password});
}

class ChangeEmployeeDepartment extends AddEmployeeEvent {
  final String? department;

  ChangeEmployeeDepartment({required this.department});
}

class ChangeEmployeePhoneNumber extends AddEmployeeEvent {
  final String? phoneNumber;

  ChangeEmployeePhoneNumber({required this.phoneNumber});
}

class ChangeEmployeeMobileNumber extends AddEmployeeEvent {
  final String? mobileNumber;

  ChangeEmployeeMobileNumber({required this.mobileNumber});
}

class ChangeEmployeeIsWork extends AddEmployeeEvent {
  final bool? isWork;

  ChangeEmployeeIsWork({required this.isWork});
}

class ChangeEmployeeDateOfJoining extends AddEmployeeEvent {
  final DateTime? dateOfJoining;

  ChangeEmployeeDateOfJoining({required this.dateOfJoining});
}

class ChangeEmployeeIDNumber extends AddEmployeeEvent {
  final String? idNumber;

  ChangeEmployeeIDNumber({required this.idNumber});
}

class ChangeEmployeeAddress extends AddEmployeeEvent {
  final String? address;

  ChangeEmployeeAddress({required this.address});
}

class ChangeEmployeeDateOfBirth extends AddEmployeeEvent {
  final DateTime? dateOfBirth;

  ChangeEmployeeDateOfBirth({required this.dateOfBirth});
}

class ChangeEmployeeAcademicSpecialization extends AddEmployeeEvent {
  final String? academicSpecialization;

  ChangeEmployeeAcademicSpecialization({required this.academicSpecialization});
}
