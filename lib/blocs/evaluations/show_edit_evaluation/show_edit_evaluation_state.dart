part of 'show_edit_evaluation_bloc.dart';

sealed class ShowEditEvaluationState extends Equatable {
  final GlobalKey<FormState> formKey;

  const ShowEditEvaluationState({required this.formKey});

  @override
  List<Object?> get props => [formKey];
}

final class InitialState extends ShowEditEvaluationState {
  const InitialState({required super.formKey});
}

final class DeleteEvaluationState extends ShowEditEvaluationState {
  const DeleteEvaluationState({required super.formKey});
}

final class ShowInfoState extends ShowEditEvaluationState {
  final EvaluationModel evaluation;
  final List<String> evaluationTypes;
  final bool isEditingEnabled;

  const ShowInfoState({
    required super.formKey,
    required this.evaluation,
    required this.evaluationTypes,
    this.isEditingEnabled = false,
  });

  ShowInfoState copyWith({
    GlobalKey<FormState>? formKey,
    EvaluationModel? evaluation,
    List<String>? evaluationTypes,
    bool? isEditingEnabled,
  }) =>
      ShowInfoState(
        formKey: formKey ?? this.formKey,
        evaluation: evaluation ?? this.evaluation,
        evaluationTypes: evaluationTypes ?? this.evaluationTypes,
        isEditingEnabled: isEditingEnabled ?? this.isEditingEnabled,
      );

  @override
  List<Object?> get props => [
        formKey,
        evaluation,
        evaluationTypes,
        isEditingEnabled,
      ];
}

final class SaveEvaluationState extends ShowInfoState {
  const SaveEvaluationState({
    required super.formKey,
    required super.evaluation,
    required super.evaluationTypes,
    super.isEditingEnabled = false,
  });

  @override
  SaveEvaluationState copyWith({
    GlobalKey<FormState>? formKey,
    EvaluationModel? evaluation,
    List<String>? evaluationTypes,
    bool? isEditingEnabled,
  }) =>
      SaveEvaluationState(
        formKey: formKey ?? this.formKey,
        evaluation: evaluation ?? this.evaluation,
        evaluationTypes: evaluationTypes ?? this.evaluationTypes,
        isEditingEnabled: isEditingEnabled ?? this.isEditingEnabled,
      );

  @override
  List<Object?> get props => [
        formKey,
        evaluation,
        evaluationTypes,
        isEditingEnabled,
      ];
}
