part of 'add_evaluation_bloc.dart';

sealed class AddEvaluationEvent {}

class AddEvent extends AddEvaluationEvent {}

class GetEvaluationTypes extends AddEvaluationEvent {
  final List<String> evaluationTypes;

  GetEvaluationTypes({required this.evaluationTypes});
}

class ChangeEvaluationName extends AddEvaluationEvent {
  final String? name;

  ChangeEvaluationName({required this.name});
}

class ChangeEvaluationType extends AddEvaluationEvent {
  final String? type;

  ChangeEvaluationType({required this.type});
}

class ChangeEvaluationFromValue extends AddEvaluationEvent {
  final int? fromValue;

  ChangeEvaluationFromValue({required this.fromValue});
}

class ChangeEvaluationToValue extends AddEvaluationEvent {
  final int? toValue;

  ChangeEvaluationToValue({required this.toValue});
}

class ChangeEvaluationTargetValue extends AddEvaluationEvent {
  final int? targetValue;

  ChangeEvaluationTargetValue({required this.targetValue});
}
