part of 'targets_bloc.dart';

sealed class TargetsState extends Equatable {
  const TargetsState();

  @override
  List<Object?> get props => [];
}

final class InitialState extends TargetsState {}

final class GetDataLoadingState extends TargetsState {}

final class GetDataFailureState extends TargetsState {
  final String message;

  const GetDataFailureState({required this.message});

  @override
  List<Object?> get props => [message];
}

final class GetDataSuccessState extends TargetsState {
  final int pointValue;
  final String searchOnEmployeesText;
  final List<EmployeeTargetsModel> employees;
  final TopInRatingCardModel? workingHours;
  final TopInRatingCardModel? callRate;
  final TopInRatingCardModel? callQuality;
  final TopInRatingCardModel? acceptanceRate;
  final TopInRatingCardModel? numberOfProblems;
  final TopInRatingCardModel? errorRate;
  final TopInRatingCardModel? callResponseEvaluation;

  const GetDataSuccessState({
    required this.pointValue,
    required this.searchOnEmployeesText,
    required this.employees,
    required this.workingHours,
    required this.callRate,
    required this.callQuality,
    required this.acceptanceRate,
    required this.numberOfProblems,
    required this.errorRate,
    required this.callResponseEvaluation,
  });

  GetDataSuccessState copyWith({
    int? pointValue,
    String? searchOnEmployeesText,
    List<EmployeeTargetsModel>? employees,
    TopInRatingCardModel? Function()? workingHours,
    TopInRatingCardModel? Function()? callRate,
    TopInRatingCardModel? Function()? callQuality,
    TopInRatingCardModel? Function()? acceptanceRate,
    TopInRatingCardModel? Function()? numberOfProblems,
    TopInRatingCardModel? Function()? errorRate,
    TopInRatingCardModel? Function()? callResponseEvaluation,
  }) =>
      GetDataSuccessState(
        pointValue: pointValue ?? this.pointValue,
        searchOnEmployeesText:
            searchOnEmployeesText ?? this.searchOnEmployeesText,
        employees: employees ?? this.employees,
        workingHours: workingHours == null ? this.workingHours : workingHours(),
        callRate: callRate == null ? this.callRate : callRate(),
        callQuality: callQuality == null ? this.callQuality : callQuality(),
        acceptanceRate:
            acceptanceRate == null ? this.acceptanceRate : acceptanceRate(),
        numberOfProblems: numberOfProblems == null
            ? this.numberOfProblems
            : numberOfProblems(),
        errorRate: errorRate == null ? this.errorRate : errorRate(),
        callResponseEvaluation: callResponseEvaluation == null
            ? this.callResponseEvaluation
            : callResponseEvaluation(),
      );

  @override
  List<Object?> get props => [
        pointValue,
        searchOnEmployeesText,
        employees,
        workingHours,
        callRate,
        callQuality,
        acceptanceRate,
        numberOfProblems,
        errorRate,
        callResponseEvaluation,
      ];
}
