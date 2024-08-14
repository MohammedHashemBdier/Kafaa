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
        List<EvaluationModel> evaluation =
            await evaluationsRepo.getEvaluations(password: '12345678');

        emit(GetEvaluationsLoadedState(evaluations: evaluation));
      } on UnauthorizedException {
        // authRepo.logout();
      } on ForbiddenException {
        // authRepo.logout();
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

        emit(state.copyWith(evaluation: newEvaluations));

        try {
          bool isAdded = await evaluationsRepo.addEvaluation(
            password: '12345678',
            evaluation: event.evaluation,
          );

          if (!isAdded) emit(state.copyWith(evaluation: oldEvaluations));
        } on UnauthorizedException {
          // authRepo.logout();
        } on ForbiddenException {
          // authRepo.logout();
        } catch (e) {
          emit(state.copyWith(evaluation: oldEvaluations));
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

        emit(state.copyWith(evaluation: newEvaluations));

        try {
          bool isEdited = await evaluationsRepo.editEvaluation(
            password: '12345678',
            evaluation: event.evaluation,
          );

          if (!isEdited) emit(state.copyWith(evaluation: oldEvaluations));
        } on UnauthorizedException {
          // authRepo.logout();
        } on ForbiddenException {
          // authRepo.logout();
        } catch (e) {
          emit(state.copyWith(evaluation: oldEvaluations));
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

        emit(state.copyWith(evaluation: newEvaluations));

        try {
          bool isDeleted = await evaluationsRepo.deleteEvaluation(
            password: '12345678',
            evaluation: event.evaluation,
          );

          if (!isDeleted) emit(state.copyWith(evaluation: oldEvaluations));
        } on UnauthorizedException {
          // authRepo.logout();
        } on ForbiddenException {
          // authRepo.logout();
        } catch (e) {
          emit(state.copyWith(evaluation: oldEvaluations));
        }
      }
    });
  }
}
