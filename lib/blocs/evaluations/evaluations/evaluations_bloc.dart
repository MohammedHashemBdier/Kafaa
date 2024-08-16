import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kafaa_app/models/evaluation_model.dart';
import 'package:kafaa_app/repos/auth_repo.dart';
import 'package:kafaa_app/repos/evaluations_repo.dart';
import 'package:kafaa_app/utils/api_exceptions.dart';

part 'evaluations_event.dart';
part 'evaluations_state.dart';

class EvaluationsBloc extends Bloc<EvaluationsEvent, EvaluationsState> {
  final EvaluationsRepo evaluationsRepo;
  final AuthRepo authRepo;

  EvaluationsBloc({required this.evaluationsRepo, required this.authRepo})
      : super(const InitialState()) {
    on<GetEvaluationsEvent>((event, emit) async {
      emit(const GetEvaluationsLoadingState());

      try {
        List<EvaluationModel> evaluations =
            await evaluationsRepo.getEvaluations(password: authRepo.password);
            
        List<String> evaluationTypes = await evaluationsRepo.getEvaluationTypes(
            password: authRepo.password);

        emit(GetEvaluationsLoadedState(
          evaluations: evaluations,
          evaluationTypes: evaluationTypes,
        ));
      } on UnauthorizedException {
        authRepo.logout();
      } on ForbiddenException {
        authRepo.logout();
      } catch (e) {
        emit(GetEvaluationsFailureState(message: e.toString()));
      }
    });

    on<AddEvaluationEvent>((event, emit) async {
      final state = this.state;

      if (state is GetEvaluationsLoadedState) {
        List<EvaluationModel> oldEvaluations =
            List<EvaluationModel>.from(state.evaluations);

        List<EvaluationModel> newEvaluations =
            List<EvaluationModel>.from(state.evaluations)
              ..add(event.evaluation);

        emit(state.copyWith(evaluations: newEvaluations));

        try {
          bool isAdded = await evaluationsRepo.addEvaluation(
            password: authRepo.password,
            evaluation: event.evaluation,
          );

          if (!isAdded) emit(state.copyWith(evaluations: oldEvaluations));
        } on UnauthorizedException {
          authRepo.logout();
        } on ForbiddenException {
          authRepo.logout();
        } catch (e) {
          emit(state.copyWith(evaluations: oldEvaluations));
        }
      }
    });

    on<EditEvaluationEvent>((event, emit) async {
      final state = this.state;

      if (state is GetEvaluationsLoadedState) {
        List<EvaluationModel> oldEvaluations =
            List<EvaluationModel>.from(state.evaluations);

        List<EvaluationModel> newEvaluations = state.evaluations
            .map((evaluation) => evaluation.id == event.evaluation.id
                ? event.evaluation
                : evaluation)
            .toList();

        emit(state.copyWith(evaluations: newEvaluations));

        try {
          bool isEdited = await evaluationsRepo.editEvaluation(
            password: authRepo.password,
            evaluation: event.evaluation,
          );

          if (!isEdited) emit(state.copyWith(evaluations: oldEvaluations));
        } on UnauthorizedException {
          authRepo.logout();
        } on ForbiddenException {
          authRepo.logout();
        } catch (e) {
          emit(state.copyWith(evaluations: oldEvaluations));
        }
      }
    });

    on<DeleteEvaluationEvent>((event, emit) async {
      final state = this.state;

      if (state is GetEvaluationsLoadedState) {
        List<EvaluationModel> oldEvaluations =
            List<EvaluationModel>.from(state.evaluations);

        List<EvaluationModel> newEvaluations = state.evaluations
            .where((evaluation) => event.evaluation != evaluation)
            .toList();

        emit(state.copyWith(evaluations: newEvaluations));

        try {
          bool isDeleted = await evaluationsRepo.deleteEvaluation(
            password: authRepo.password,
            evaluation: event.evaluation,
          );

          if (!isDeleted) emit(state.copyWith(evaluations: oldEvaluations));
        } on UnauthorizedException {
          authRepo.logout();
        } on ForbiddenException {
          authRepo.logout();
        } catch (e) {
          emit(state.copyWith(evaluations: oldEvaluations));
        }
      }
    });
  }
}
