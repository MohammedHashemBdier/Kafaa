part of 'evaluations_bloc.dart';

sealed class EvaluationsEvent {}

class GetEvaluationsEvent extends EvaluationsEvent {}

class AddEvaluationEvent extends EvaluationsEvent {
  final EvaluationModel evaluation;

  AddEvaluationEvent({required this.evaluation});
}

class EditEvaluationEvent extends EvaluationsEvent {
  final EvaluationModel evaluation;

  EditEvaluationEvent({required this.evaluation});
}

class DeleteEvaluationEvent extends EvaluationsEvent {
  final EvaluationModel evaluation;

  DeleteEvaluationEvent({required this.evaluation});
}
