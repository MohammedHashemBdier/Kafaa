part of 'show_edit_evaluation_bloc.dart';

sealed class ShowEditEvaluationEvent {}

class InitEvaluationDialogEvent extends ShowEditEvaluationEvent {
  final EvaluationModel evaluation;
  final List<String> evaluationTypes;

  InitEvaluationDialogEvent({
    required this.evaluation,
    required this.evaluationTypes,
  });
}

class DeleteEvaluationEvent extends ShowEditEvaluationEvent {}

class SaveEvaluationEvent extends ShowEditEvaluationEvent {}

class EnableDisableEditingEvent extends ShowEditEvaluationEvent {}

class ChangeEvaluationName extends ShowEditEvaluationEvent {
  final String? name;

  ChangeEvaluationName({required this.name});
}

class ChangeEvaluationType extends ShowEditEvaluationEvent {
  final String? type;

  ChangeEvaluationType({required this.type});
}

class ChangeEvaluationFromValue extends ShowEditEvaluationEvent {
  final int? fromValue;

  ChangeEvaluationFromValue({required this.fromValue});
}

class ChangeEvaluationToValue extends ShowEditEvaluationEvent {
  final int? toValue;

  ChangeEvaluationToValue({required this.toValue});
}

class ChangeEvaluationTargetValue extends ShowEditEvaluationEvent {
  final int? targetValue;

  ChangeEvaluationTargetValue({required this.targetValue});
}
