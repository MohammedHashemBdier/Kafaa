import 'package:equatable/equatable.dart';

class EmployeeModel extends Equatable {
  final int? id;
  final String? name;
  final String? username;
  final String? password;
  final String? department;
  final String? phoneNumber;
  final String? mobileNumber;
  final bool? isWork;
  final DateTime? dateOfJoining;
  final String? idNumber;
  final String? address;
  final DateTime? dateOfBirth;
  final String? academicSpecialization;

  const EmployeeModel({
    this.id,
    this.name,
    this.username,
    this.password,
    this.department,
    this.phoneNumber,
    this.mobileNumber,
    this.isWork,
    this.dateOfJoining,
    this.idNumber,
    this.address,
    this.dateOfBirth,
    this.academicSpecialization,
  });

  EmployeeModel copyWith({
    int? Function()? id,
    String? Function()? name,
    String? Function()? username,
    String? Function()? password,
    String? Function()? department,
    String? Function()? phoneNumber,
    String? Function()? mobileNumber,
    bool? Function()? isWork,
    DateTime? Function()? dateOfJoining,
    String? Function()? idNumber,
    String? Function()? address,
    DateTime? Function()? dateOfBirth,
    String? Function()? academicSpecialization,
  }) =>
      EmployeeModel(
        id: id == null ? this.id : id(),
        name: name == null ? this.name : name(),
        username: username == null ? this.username : username(),
        password: password == null ? this.password : password(),
        department: department == null ? this.department : department(),
        phoneNumber: phoneNumber == null ? this.phoneNumber : phoneNumber(),
        mobileNumber: mobileNumber == null ? this.mobileNumber : mobileNumber(),
        isWork: isWork == null ? this.isWork : isWork(),
        dateOfJoining:
            dateOfJoining == null ? this.dateOfJoining : dateOfJoining(),
        idNumber: idNumber == null ? this.idNumber : idNumber(),
        address: address == null ? this.address : address(),
        dateOfBirth: dateOfBirth == null ? this.dateOfBirth : dateOfBirth(),
        academicSpecialization: academicSpecialization == null
            ? this.academicSpecialization
            : academicSpecialization(),
      );

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        password: json["password"],
        department: json["section"],
        phoneNumber: json["home_num"],
        mobileNumber: json["phone_num"],
        isWork: json["status"] == null ? null : json["status"] == 1,
        dateOfJoining:
            json["join"] == null ? null : DateTime.parse(json["join"]),
        idNumber: json["id_num"],
        address: json["address"],
        dateOfBirth:
            json["birth"] == null ? null : DateTime.parse(json["birth"]),
        academicSpecialization: json["edu"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "password": password,
        "section": department,
        "home_num": phoneNumber,
        "phone_num": mobileNumber,
        "status": isWork,
        "join": dateOfJoining?.toString(),
        "id_num": idNumber,
        "address": address,
        "birth": dateOfBirth?.toString(),
        "edu": academicSpecialization,
      };

  static List<EmployeeModel> listFromJson(List json) =>
      List<EmployeeModel>.from(
          json.map((employee) => EmployeeModel.fromJson(employee)));

  @override
  List<Object?> get props => [
        id,
        name,
        username,
        password,
        department,
        phoneNumber,
        mobileNumber,
        isWork,
        dateOfJoining,
        idNumber,
        address,
        dateOfBirth,
        academicSpecialization,
      ];
}
