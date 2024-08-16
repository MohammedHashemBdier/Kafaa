part of 'show_edit_employee_bloc.dart';

sealed class ShowEditEmployeeState extends Equatable {
  final GlobalKey<FormState> formKey;

  const ShowEditEmployeeState({required this.formKey});

  @override
  List<Object?> get props => [formKey];
}

final class InitialState extends ShowEditEmployeeState {
  const InitialState({required super.formKey});
}

final class DeleteEvaluationState extends ShowEditEmployeeState {
  const DeleteEvaluationState({required super.formKey});
}

final class ShowInfoState extends ShowEditEmployeeState {
  final EmployeeModel employee;
  final bool isEditingEnabled;

  const ShowInfoState({
    required super.formKey,
    required this.employee,
    this.isEditingEnabled = false,
  });

  ShowInfoState copyWith({
    GlobalKey<FormState>? formKey,
    EmployeeModel? employee,
    bool? isEditingEnabled,
  }) =>
      ShowInfoState(
        formKey: formKey ?? this.formKey,
        employee: employee ?? this.employee,
        isEditingEnabled: isEditingEnabled ?? this.isEditingEnabled,
      );

  @override
  List<Object?> get props => [formKey, employee, isEditingEnabled];
}

final class SaveEvaluationState extends ShowInfoState {
  const SaveEvaluationState({
    required super.formKey,
    required super.employee,
    super.isEditingEnabled = false,
  });

  @override
  SaveEvaluationState copyWith({
    GlobalKey<FormState>? formKey,
    EmployeeModel? employee,
    bool? isEditingEnabled,
  }) =>
      SaveEvaluationState(
        formKey: formKey ?? this.formKey,
        employee: employee ?? this.employee,
        isEditingEnabled: isEditingEnabled ?? this.isEditingEnabled,
      );

  @override
  List<Object?> get props => [formKey, employee, isEditingEnabled];
}
