import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafaa_app/blocks/evaluations/add_evaluation/add_evaluation_bloc.dart';
import 'package:kafaa_app/models/evaluation_model.dart';
import 'package:kafaa_app/widgets/evaluation_page/add_evaluation_body.dart';
import 'package:kafaa_app/widgets/evaluation_page/add_evaluation_header.dart';

class AddEvaluationSection extends StatelessWidget {
  final void Function(EvaluationModel evaluation) onAdd;

  const AddEvaluationSection({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddEvaluationBloc(),
      child: BlocListener<AddEvaluationBloc, AddEvaluationState>(
        listener: (context, state) {
          if (state is AddState) onAdd.call(state.evaluation);
        },
        child: const Column(
          children: [
            AddEvaluationHeader(),
            AddEvaluationBody(),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
