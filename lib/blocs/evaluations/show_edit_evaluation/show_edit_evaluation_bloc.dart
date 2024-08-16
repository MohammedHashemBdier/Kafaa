import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kafaa_app/models/evaluation_model.dart';

part 'show_edit_evaluation_event.dart';
part 'show_edit_evaluation_state.dart';

class ShowEditEvaluationBloc
    extends Bloc<ShowEditEvaluationEvent, ShowEditEvaluationState> {
  ShowEditEvaluationBloc()
      : super(InitialState(formKey: GlobalKey<FormState>())) {
    on<InitEvaluationDialogEvent>((event, emit) {
      emit(ShowInfoState(
        formKey: state.formKey,
        evaluation: event.evaluation,
        evaluationTypes: event.evaluationTypes,
      ));
    });

    on<DeleteEvaluationEvent>((event, emit) {
      emit(DeleteEvaluationState(formKey: state.formKey));
    });

    on<EnableDisableEditingEvent>((event, emit) {
      final state = this.state;
      if (state is ShowInfoState)
        emit(ShowInfoState(
          formKey: state.formKey,
          evaluation: state.evaluation,
          evaluationTypes: state.evaluationTypes,
          isEditingEnabled: !state.isEditingEnabled,
        ));
    });

    on<SaveEvaluationEvent>((event, emit) {
      final state = this.state;
      if (state is ShowInfoState && state.formKey.currentState!.validate())
        emit(SaveEvaluationState(
          formKey: state.formKey,
          evaluation: state.evaluation,
          evaluationTypes: state.evaluationTypes,
          isEditingEnabled: !state.isEditingEnabled,
        ));
    });

    on<ChangeEvaluationName>((event, emit) {
      final state = this.state;
      if (state is ShowInfoState)
        emit(
          state.copyWith(
            evaluation: state.evaluation.copyWith(name: () => event.name),
          ),
        );
    });

    on<ChangeEvaluationType>((event, emit) {
      final state = this.state;
      if (state is ShowInfoState)
        emit(
          state.copyWith(
            evaluation: state.evaluation.copyWith(type: () => event.type),
          ),
        );
    });

    on<ChangeEvaluationFromValue>((event, emit) {
      final state = this.state;
      if (state is ShowInfoState)
        emit(
          state.copyWith(
            evaluation:
                state.evaluation.copyWith(fromValue: () => event.fromValue),
          ),
        );
    });

    on<ChangeEvaluationToValue>((event, emit) {
      final state = this.state;
      if (state is ShowInfoState)
        emit(
          state.copyWith(
            evaluation: state.evaluation.copyWith(toValue: () => event.toValue),
          ),
        );
    });

    on<ChangeEvaluationTargetValue>((event, emit) {
      final state = this.state;
      if (state is ShowInfoState)
        emit(
          state.copyWith(
            evaluation:
                state.evaluation.copyWith(targetValue: () => event.targetValue),
          ),
        );
    });
  }
}
