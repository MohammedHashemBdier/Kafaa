import 'package:equatable/equatable.dart';

class EmployeeTargetsModel extends Equatable {
  final int id;
  final String name;
  final int points;
  final int pointsValue;
  final DateTime lastEdit;

  const EmployeeTargetsModel({
    required this.id,
    required this.name,
    required this.points,
    required this.pointsValue,
    required this.lastEdit,
  });

  EmployeeTargetsModel copyWith({
    int? id,
    String? name,
    int? points,
    int? pointsValue,
    DateTime? lastEdit,
  }) =>
      EmployeeTargetsModel(
        id: id ?? this.id,
        name: name ?? this.name,
        points: points ?? this.points,
        pointsValue: pointsValue ?? this.pointsValue,
        lastEdit: lastEdit ?? this.lastEdit,
      );

  factory EmployeeTargetsModel.fromJson(Map<String, dynamic> json) =>
      EmployeeTargetsModel(
        id: json["id"],
        name: json["name"],
        points: json["points"],
        pointsValue: json["pointsValue"],
        lastEdit: json["lastEdit"],
      );

  Map<String, dynamic> toJson() => {};

  static List<EmployeeTargetsModel> listFromJson(List json) =>
      List<EmployeeTargetsModel>.from(
          json.map((employee) => EmployeeTargetsModel.fromJson(employee)));

  @override
  List<Object?> get props => [id, name, points, pointsValue, lastEdit];
}
