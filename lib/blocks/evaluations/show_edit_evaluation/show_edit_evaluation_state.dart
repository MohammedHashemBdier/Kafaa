// part of 'show_edit_evaluation_bloc.dart';

// sealed class ShowEditEmployeeState extends Equatable {
//   final GlobalKey<FormState> formKey;

//   const ShowEditEmployeeState({required this.formKey});

//   @override
//   List<Object?> get props => [formKey];
// }

// final class InitialState extends ShowEditEmployeeState {
//   const InitialState({required super.formKey});
// }

// final class DeleteState extends ShowEditEmployeeState {
//   const DeleteState({required super.formKey});
// }

// final class ShowInfoState extends ShowEditEmployeeState {
//   final EmployeeModel employee;
//   final bool isEditingEnabled;

//   const ShowInfoState({
//     required super.formKey,
//     required this.employee,
//     this.isEditingEnabled = false,
//   });

//   ShowInfoState copyWith({
//     GlobalKey<FormState>? formKey,
//     EmployeeModel? employee,
//     bool? isEditingEnabled,
//   }) =>
//       ShowInfoState(
//         formKey: formKey ?? this.formKey,
//         employee: employee ?? this.employee,
//         isEditingEnabled: isEditingEnabled ?? this.isEditingEnabled,
//       );

//   @override
//   List<Object?> get props => [formKey, employee, isEditingEnabled];
// }

// final class SaveState extends ShowInfoState {
//   const SaveState({
//     required super.formKey,
//     required super.employee,
//     super.isEditingEnabled = false,
//   });

//   @override
//   SaveState copyWith({
//     GlobalKey<FormState>? formKey,
//     EmployeeModel? employee,
//     bool? isEditingEnabled,
//   }) =>
//       SaveState(
//         formKey: formKey ?? this.formKey,
//         employee: employee ?? this.employee,
//         isEditingEnabled: isEditingEnabled ?? this.isEditingEnabled,
//       );

//   @override
//   List<Object?> get props => [formKey, employee, isEditingEnabled];
// }
