part of 'evaluations_bloc.dart';

sealed class EvaluationsState extends Equatable {
  const EvaluationsState();

  EvaluationsState copyWith();

  @override
  List<Object?> get props => [];
}

final class InitialState extends EvaluationsState {
  const InitialState();

  @override
  InitialState copyWith() => const InitialState();
}

final class GetEvaluationsLoadingState extends EvaluationsState {
  const GetEvaluationsLoadingState();

  @override
  GetEvaluationsLoadingState copyWith() => const GetEvaluationsLoadingState();
}

final class GetEvaluationsFailureState extends EvaluationsState {
  final String message;

  const GetEvaluationsFailureState({required this.message});

  @override
  GetEvaluationsFailureState copyWith({String? message}) =>
      GetEvaluationsFailureState(message: message ?? this.message);

  @override
  List<Object?> get props => [message];
}

final class GetEvaluationsLoadedState extends EvaluationsState {
  final List<EvaluationModel> evaluations;
  final List<String> evaluationTypes;

  const GetEvaluationsLoadedState({
    required this.evaluations,
    required this.evaluationTypes,
  });

  @override
  GetEvaluationsLoadedState copyWith({
    List<EvaluationModel>? evaluations,
    List<String>? evaluationTypes,
  }) =>
      GetEvaluationsLoadedState(
        evaluations: evaluations ?? this.evaluations,
        evaluationTypes: evaluationTypes ?? this.evaluationTypes,
      );

  @override
  List<Object?> get props => [evaluations, evaluationTypes];
}
