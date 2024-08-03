import 'package:flutter/material.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/widgets/custom_dropdown_list.dart';
import 'package:kafaa_app/widgets/custom_number_field.dart';
import 'package:kafaa_app/widgets/custom_text_field.dart';

class EvaluationInfo extends StatefulWidget {
  const EvaluationInfo({
    super.key,
    required this.enabled,
  });

  final bool enabled;

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
    return Column(
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
            label: "تقييم معدل المكالمات متوسط",
            enabled: widget.enabled,
            prefixIcon: const Icon(Icons.star),
            hint: S.of(context).add_evaluation_name,
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
            label: "معدل المكالمات اليومي",
            hintText: S.of(context).choose_evaluation_type,
            icon: Icon(
              Icons.star,
              color: AppColors.c5,
            ),
            enabled: widget.enabled,
            onChose: (val) {},
          ),
          3,
        ),
        buildAnimatedField(
          Text(S.of(context).from_value),
          4,
        ),
        buildAnimatedField(
          CustomNumberField(
            label: "50",
            enabled: widget.enabled,
            prefixIcon: const Icon(Icons.star),
            hint: S.of(context).enter_the_value_of_the_first_field,
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
          CustomNumberField(
            label: "75",
            enabled: widget.enabled,
            prefixIcon: const Icon(Icons.star),
            hint: S.of(context).enter_the_value_of_the_second_field,
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
          CustomNumberField(
            label: "4",
            enabled: widget.enabled,
            prefixIcon: const Icon(Icons.star),
            hint: S.of(context).add_target_value,
          ),
          9,
        ),
      ],
    );
  }
}
