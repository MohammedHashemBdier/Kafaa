import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafaa_app/blocs/evaluations/show_edit_evaluation/show_edit_evaluation_bloc.dart';
import 'package:kafaa_app/helpers/extensions/string_extensions.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/models/evaluation_model.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/widgets/custom_dropdown_list.dart';
import 'package:kafaa_app/widgets/custom_text_field.dart';

class EvaluationInfo extends StatefulWidget {
  const EvaluationInfo({super.key});

  @override
  EvaluationInfoState createState() => EvaluationInfoState();
}

class EvaluationInfoState extends State<EvaluationInfo>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 9),
    );
    _animations = List.generate(10, (index) {
      double start = index * 0.01;
      double end = start + 0.1;
      return CurvedAnimation(
        parent: _controller,
        curve: Interval(start, end > 1.0 ? 1.0 : end, curve: Curves.easeInOut),
      );
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildAnimatedField(Widget child, int index) {
    return FadeTransition(
      opacity: _animations[index],
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.1),
          end: Offset.zero,
        ).animate(_animations[index]),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowEditEvaluationBloc, ShowEditEvaluationState>(
      buildWhen: (previous, current) =>
          current is ShowInfoState && previous is! ShowInfoState,
      builder: (context, state) {
        if (state is ShowInfoState) {
          return BlocBuilder<ShowEditEvaluationBloc, ShowEditEvaluationState>(
            buildWhen: (previous, current) => current is SaveEvaluationState,
            builder: (context, state) {
              if (state is ShowInfoState) {
                EvaluationModel oldEvaluation = state.evaluation;

                return BlocBuilder<ShowEditEvaluationBloc,
                    ShowEditEvaluationState>(
                  buildWhen: (previous, current) {
                    return current is ShowInfoState &&
                            previous is ShowInfoState &&
                            current.isEditingEnabled !=
                                previous.isEditingEnabled
                        ? true
                        : false;
                  },
                  builder: (context, state) {
                    if (state is ShowInfoState) {
                      EvaluationModel newEvaluation = state.evaluation;
                      bool enabled = state.isEditingEnabled;

                      return Form(
                        key: state.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            buildAnimatedField(
                              Text(
                                S.of(context).evaluation_name,
                              ),
                              0,
                            ),
                            buildAnimatedField(
                              CustomTextField(
                                controller: TextEditingController(
                                    text: enabled
                                        ? newEvaluation.name ?? ''
                                        : ''),
                                label: oldEvaluation.name ?? '',
                                prefixIcon: const Icon(Icons.star),
                                hint: S.of(context).add_evaluation_name,
                                enabled: enabled,
                                validator: (value) =>
                                    value == null || value.isEmpty
                                        ? 'S.of(context).this_field_is_required'
                                        : null,
                                onChanged: (value) => context
                                    .read<ShowEditEvaluationBloc>()
                                    .add(ChangeEvaluationName(name: value)),
                              ),
                              1,
                            ),
                            buildAnimatedField(
                              Text(
                                S.of(context).evaluation_type,
                              ),
                              2,
                            ),
                            buildAnimatedField(
                              CustomDropdownList(
                                menuItems: const [
                                  "معدل المكالمات اليومي",
                                  "تقييم الدوام",
                                  "اخطاء المتابعة",
                                  "نسبة القبول",
                                  "جودة المكالمات",
                                ],
                                label: oldEvaluation.type ?? '',
                                hintText: S.of(context).choose_evaluation_type,
                                icon: Icon(
                                  Icons.star,
                                  color: AppColors.c5,
                                ),
                                enabled: enabled,
                                onChose: (value) => context
                                    .read<ShowEditEvaluationBloc>()
                                    .add(ChangeEvaluationType(type: value)),
                              ),
                              3,
                            ),
                            buildAnimatedField(
                              Text(S.of(context).from_value),
                              4,
                            ),
                            buildAnimatedField(
                              CustomTextField(
                                controller: TextEditingController(
                                    text: enabled
                                        ? newEvaluation.fromValue?.toString() ??
                                            ''
                                        : ''),
                                label:
                                    oldEvaluation.fromValue?.toString() ?? '',
                                prefixIcon: const Icon(Icons.star),
                                hint: S
                                    .of(context)
                                    .enter_the_value_of_the_first_field,
                                enabled: enabled,
                                validator: (value) =>
                                    value == null || value.isEmpty
                                        ? 'S.of(context).this_field_is_required'
                                        : null,
                                onChanged: (value) => context
                                    .read<ShowEditEvaluationBloc>()
                                    .add(ChangeEvaluationFromValue(
                                        fromValue: value.toIntOrNull())),
                              ),
                              5,
                            ),
                            buildAnimatedField(
                              Text(
                                S.of(context).to_value,
                              ),
                              6,
                            ),
                            buildAnimatedField(
                              CustomTextField(
                                controller: TextEditingController(
                                    text: enabled
                                        ? newEvaluation.toValue?.toString() ??
                                            ''
                                        : ''),
                                label: oldEvaluation.toValue?.toString() ?? '',
                                prefixIcon: const Icon(Icons.star),
                                hint: S
                                    .of(context)
                                    .enter_the_value_of_the_second_field,
                                enabled: enabled,
                                validator: (value) =>
                                    value == null || value.isEmpty
                                        ? 'S.of(context).this_field_is_required'
                                        : null,
                                onChanged: (value) => context
                                    .read<ShowEditEvaluationBloc>()
                                    .add(ChangeEvaluationToValue(
                                        toValue: value.toIntOrNull())),
                              ),
                              7,
                            ),
                            buildAnimatedField(
                              Text(
                                S.of(context).target_value,
                              ),
                              8,
                            ),
                            buildAnimatedField(
                              CustomTextField(
                                controller: TextEditingController(
                                    text: enabled
                                        ? newEvaluation.targetValue
                                                ?.toString() ??
                                            ''
                                        : ''),
                                label:
                                    oldEvaluation.targetValue?.toString() ?? '',
                                prefixIcon: const Icon(Icons.star),
                                hint: S.of(context).add_target_value,
                                enabled: enabled,
                                validator: (value) =>
                                    value == null || value.isEmpty
                                        ? 'S.of(context).this_field_is_required'
                                        : null,
                                onChanged: (value) => context
                                    .read<ShowEditEvaluationBloc>()
                                    .add(ChangeEvaluationTargetValue(
                                        targetValue: value.toIntOrNull())),
                              ),
                              9,
                            ),
                          ],
                        ),
                      );
                    }

                    return const SizedBox();
                  },
                );
              }
              return const SizedBox();
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
