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
  final bool isEditingEnabled;

  const ShowInfoState({
    required super.formKey,
    required this.evaluation,
    this.isEditingEnabled = false,
  });

  ShowInfoState copyWith({
    GlobalKey<FormState>? formKey,
    EvaluationModel? evaluation,
    bool? isEditingEnabled,
  }) =>
      ShowInfoState(
        formKey: formKey ?? this.formKey,
        evaluation: evaluation ?? this.evaluation,
        isEditingEnabled: isEditingEnabled ?? this.isEditingEnabled,
      );

  @override
  List<Object?> get props => [formKey, evaluation, isEditingEnabled];
}

final class SaveEvaluationState extends ShowInfoState {
  const SaveEvaluationState({
    required super.formKey,
    required super.evaluation,
    super.isEditingEnabled = false,
  });

  @override
  SaveEvaluationState copyWith({
    GlobalKey<FormState>? formKey,
    EvaluationModel? evaluation,
    bool? isEditingEnabled,
  }) =>
      SaveEvaluationState(
        formKey: formKey ?? this.formKey,
        evaluation: evaluation ?? this.evaluation,
        isEditingEnabled: isEditingEnabled ?? this.isEditingEnabled,
      );

  @override
  List<Object?> get props => [formKey, evaluation, isEditingEnabled];
}
