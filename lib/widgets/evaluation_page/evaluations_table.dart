import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafaa_app/blocks/evaluations/evaluations/evaluations_bloc.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/models/Evaluation_model.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/app_styles.dart';
import 'package:kafaa_app/widgets/custom_app_container.dart';
import 'package:kafaa_app/widgets/evaluation_page/evaluation_info_dialog.dart';
import 'package:kafaa_app/widgets/evaluation_page/evaluations_table_header.dart';

class EvaluationsTable extends StatefulWidget {
  const EvaluationsTable({super.key});

  @override
  EvaluationsTableState createState() => EvaluationsTableState();
}

class EvaluationsTableState extends State<EvaluationsTable>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomAppContainer(
      child: BlocBuilder<EvaluationsBloc, EvaluationsState>(
        builder: (context, state) {
          if (state is GetEvaluationsLoadingState)
            return const Center(child: CircularProgressIndicator());
          else if (state is GetEvaluationsFailureState)
            return const Text('error');
          else if (state is GetEvaluationsLoadedState)
            return Card(
              elevation: 3,
              color: AppColors.c2,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Table(
                    border: TableBorder(
                      horizontalInside:
                          BorderSide(color: AppColors.c4, width: 10),
                    ),
                    children: [
                      evaluationTableHeader(context),
                      ...state.evaluations.mapIndexed((index, evaluation) =>
                          tableBody(context, index, evaluation))
                    ],
                  );
                },
              ),
            );
          return const SizedBox();
        },
      ),
    );
  }

  TableRow tableBody(
    BuildContext context,
    int index,
    EvaluationModel evaluation,
  ) {
    Animation<double> animation = CurvedAnimation(
      parent: _controller,
      curve: Interval(
        (index / 10),
        1.0,
        curve: Curves.easeInOut,
      ),
    );

    return TableRow(
      children: [
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Tooltip(
            showDuration: const Duration(milliseconds: 700),
            waitDuration: const Duration(milliseconds: 700),
            message: S.of(context).evaluation_info,
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return EvaluationsInfoDialog(
                      evaluation: evaluation,
                      onDelete: () => context
                          .read<EvaluationsBloc>()
                          .add(DeleteEvaluationEvent(evaluation: evaluation)),
                      onEdit: (newEvaluation) => context
                          .read<EvaluationsBloc>()
                          .add(EditEvaluationEvent(evaluation: newEvaluation)),
                    );
                  },
                );
              },
              child: FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 0.1),
                    end: Offset.zero,
                  ).animate(animation),
                  child: const Center(
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.star_border_outlined)),
                  ),
                ),
              ),
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.1),
                  end: Offset.zero,
                ).animate(animation),
                child: Text(
                  evaluation.name ?? '---',
                  textAlign: TextAlign.center,
                  style: AppStyles.styleRegular16(context),
                ),
              ),
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.1),
                  end: Offset.zero,
                ).animate(animation),
                child: Text(
                  evaluation.type ?? '---',
                  textAlign: TextAlign.center,
                  style: AppStyles.styleRegular16(context),
                ),
              ),
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.1),
                  end: Offset.zero,
                ).animate(animation),
                child: Text(
                  evaluation.fromValue?.toString() ?? '---',
                  textAlign: TextAlign.center,
                  style: AppStyles.styleRegular16(context),
                ),
              ),
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.1),
                  end: Offset.zero,
                ).animate(animation),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    evaluation.toValue?.toString() ?? '---',
                    textAlign: TextAlign.center,
                    style: AppStyles.styleRegular16(context),
                  ),
                ),
              ),
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.1),
                  end: Offset.zero,
                ).animate(animation),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    evaluation.targetValue?.toString() ?? '---',
                    textAlign: TextAlign.center,
                    style: AppStyles.styleRegular16(context),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
