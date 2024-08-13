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

  const GetEvaluationsLoadedState({required this.evaluations});

  @override
  GetEvaluationsLoadedState copyWith({List<EvaluationModel>? evaluation}) =>
      GetEvaluationsLoadedState(evaluations: evaluation ?? evaluations);

  @override
  List<Object?> get props => [evaluations];
}
