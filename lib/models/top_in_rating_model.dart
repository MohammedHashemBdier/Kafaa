import 'package:equatable/equatable.dart';

class EmployeeTargetsModel extends Equatable {
  final String employeeName;
  final String evaluationName;
  final int points;

  const EmployeeTargetsModel({
    required this.employeeName,
    required this.evaluationName,
    required this.points,
  });

  @override
  List<Object?> get props => [employeeName, evaluationName, points];
}
