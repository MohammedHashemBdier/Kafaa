part of 'add_evaluation_bloc.dart';

sealed class AddEvaluationState extends Equatable {
  final EvaluationModel evaluation;
  final GlobalKey<FormState> formKey;

  const AddEvaluationState({
    this.evaluation = const EvaluationModel(),
    required this.formKey,
  });

  @override
  List<Object> get props => [evaluation, formKey];
}

final class InitialState extends AddEvaluationState {
  const InitialState({
    super.evaluation,
    required super.formKey,
  });
}

final class WriteState extends AddEvaluationState {
  const WriteState({
    required super.evaluation,
    required super.formKey,
  });
}

final class AddState extends AddEvaluationState {
  const AddState({
    required super.evaluation,
    required super.formKey,
  });
}
