part of 'show_edit_employee_bloc.dart';

sealed class ShowEditEmployeeState extends Equatable {
  const ShowEditEmployeeState();
  @override
  List<Object?> get props => [];
}

final class InitialState extends ShowEditEmployeeState {}

final class DeleteState extends ShowEditEmployeeState {}

final class ShowInfoState extends ShowEditEmployeeState {
  final EmployeeModel employee;
  final bool isEditingEnabled;

  const ShowInfoState({
    required this.employee,
    this.isEditingEnabled = false,
  });

  ShowInfoState copyWith({
    EmployeeModel? employee,
    bool? isEditingEnabled,
  }) =>
      ShowInfoState(
        employee: employee ?? this.employee,
        isEditingEnabled: isEditingEnabled ?? this.isEditingEnabled,
      );

  @override
  List<Object?> get props => [employee, isEditingEnabled];
}

final class SaveState extends ShowInfoState {
  const SaveState({
    required super.employee,
    super.isEditingEnabled = false,
  });

  @override
  SaveState copyWith({
    EmployeeModel? employee,
    bool? isEditingEnabled,
  }) =>
      SaveState(
        employee: employee ?? this.employee,
        isEditingEnabled: isEditingEnabled ?? this.isEditingEnabled,
      );

  @override
  List<Object?> get props => [employee, isEditingEnabled];
}

// final class EditState extends ShowInfoState {
//   final EmployeeModel editEmployee;

//   const EditState({
//     required super.employee,
//     this.editEmployee = const EmployeeModel(),
//   });

//   @override
//   List<Object?> get props => [employee, editEmployee];
// }
