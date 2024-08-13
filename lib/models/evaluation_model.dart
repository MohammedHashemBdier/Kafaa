import 'package:equatable/equatable.dart';

class EvaluationModel extends Equatable {
  final int? id;
  final String? name;
  final String? type;
  final int? fromValue;
  final int? toValue;
  final int? targetValue;

  const EvaluationModel({
    this.id,
    this.name,
    this.type,
    this.fromValue,
    this.toValue,
    this.targetValue,
  });

  EvaluationModel copyWith({
    int? Function()? id,
    String? Function()? name,
    String? Function()? type,
    int? Function()? fromValue,
    int? Function()? toValue,
    int? Function()? targetValue,
  }) =>
      EvaluationModel(
        id: id == null ? this.id : id(),
        name: name == null ? this.name : name(),
        type: type == null ? this.type : type(),
        fromValue: fromValue == null ? this.fromValue : fromValue(),
        toValue: toValue == null ? this.toValue : toValue(),
        targetValue: targetValue == null ? this.targetValue : targetValue(),
      );

  factory EvaluationModel.fromJson(Map<String, dynamic> json) =>
      EvaluationModel(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        fromValue: json["from"],
        toValue: json["to"],
        targetValue: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "from": fromValue,
        "to": toValue,
        "value": targetValue,
      };

  static List<EvaluationModel> listFromJson(List json) =>
      List<EvaluationModel>.from(
          json.map((evaluation) => EvaluationModel.fromJson(evaluation)));

  @override
  List<Object?> get props => [id, name, type, fromValue, toValue, targetValue];
}
