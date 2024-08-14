import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kafaa_app/models/evaluation_model.dart';

part 'add_evaluation_event.dart';
part 'add_evaluation_state.dart';

class AddEvaluationBloc extends Bloc<AddEvaluationEvent, AddEvaluationState> {
  AddEvaluationBloc() : super(InitialState(formKey: GlobalKey<FormState>())) {
    on<AddEvent>((event, emit) {
      if (state.formKey.currentState!.validate()) {
        emit(AddState(evaluation: state.evaluation, formKey: state.formKey));
        emit(InitialState(formKey: state.formKey));
      }
    });

    on<ChangeEvaluationName>((event, emit) {
      emit(
        WriteState(
          formKey: state.formKey,
          evaluation: state.evaluation.copyWith(name: () => event.name),
        ),
      );
    });

    on<ChangeEvaluationType>((event, emit) {
      emit(
        WriteState(
          formKey: state.formKey,
          evaluation: state.evaluation.copyWith(type: () => event.type),
        ),
      );
    });

    on<ChangeEvaluationFromValue>((event, emit) {
      emit(
        WriteState(
          formKey: state.formKey,
          evaluation:
              state.evaluation.copyWith(fromValue: () => event.fromValue),
        ),
      );
    });

    on<ChangeEvaluationToValue>((event, emit) {
      emit(
        WriteState(
          formKey: state.formKey,
          evaluation: state.evaluation.copyWith(toValue: () => event.toValue),
        ),
      );
    });

    on<ChangeEvaluationTargetValue>((event, emit) {
      emit(
        WriteState(
          formKey: state.formKey,
          evaluation:
              state.evaluation.copyWith(targetValue: () => event.targetValue),
        ),
      );
    });
  }
}
