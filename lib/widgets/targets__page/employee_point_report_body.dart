import "package:flutter/material.dart";
import "package:kafaa_app/generated/l10n.dart";
import "package:kafaa_app/widgets/targets__page/employee_point_report_add_delete_card.dart";
import "package:kafaa_app/widgets/targets__page/employee_point_report_card.dart";

class EmployeePointReportBody extends StatefulWidget {
  const EmployeePointReportBody({super.key});

  @override
  AddEvaluationBodyState createState() => AddEvaluationBodyState();
}

class AddEvaluationBodyState extends State<EmployeePointReportBody>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 7),
    );
    _animations = List.generate(8, (index) {
      double start = index * 0.05;
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
      children: [
        buildAnimatedField(
          EmployeePointReportCard(
            enable: false,
            evaluationName: S.of(context).working_hours_evaluation,
            evaluationNumberName: S.of(context).Monthly_working_hours,
            evaluationAverageName: S.of(context).daily_working_hours,
            evaluationAverage: 90,
            points: 10,
            onDelete: () {},
          ),
          0,
        ),
        buildAnimatedField(
          EmployeePointReportCard(
            enable: true,
            evaluationName: S.of(context).Call_count_evaluation,
            evaluationNumberName: S.of(context).Number_of_monthly_calls,
            evaluationNumber: "2000",
            evaluationAverageName: S.of(context).Daily_call_rate,
            evaluationAverage: 30,
            points: 50,
            onDelete: () {},
          ),
          1,
        ),
        buildAnimatedField(
          EmployeePointReportCard(
            enable: true,
            evaluationName: S.of(context).Evaluate_follow_up_errors,
            evaluationNumberName:
                S.of(context).Number_of_monthly_follow_up_errors,
            evaluationNumber: "10",
            evaluationAverageName: S.of(context).Daily_error_rate,
            evaluationAverage: 1,
            points: -4,
            onDelete: () {},
          ),
          2,
        ),
        buildAnimatedField(
          EmployeePointReportCard(
            enable: true,
            evaluationName: S.of(context).Call_Quality_Rating,
            evaluationNumberName: S.of(context).Call_Quality_0_to_100,
            evaluationNumber: "90",
            evaluationAverageName: S.of(context).Monthly_Call_Quality_Average,
            evaluationAverage: 90,
            points: 9,
            onDelete: () {},
          ),
          3,
        ),
        buildAnimatedField(
          EmployeePointReportCard(
            enable: true,
            evaluationName: S.of(context).Evaluate_problem_cards,
            evaluationNumberName: S.of(context).Number_of_monthly_problem_cards,
            evaluationNumber: "300",
            evaluationAverageName: S.of(context).Monthly_problem_card_rate,
            evaluationAverage: 300,
            points: 10,
            onDelete: () {},
          ),
          4,
        ),
        buildAnimatedField(
          EmployeePointReportCard(
            enable: true,
            evaluationName: S.of(context).Call_response_Evaluation,
            evaluationNumberName:
                S.of(context).Call_response_rate_from_0_to_100,
            evaluationNumber: "70",
            evaluationAverageName: S.of(context).Reply_rate_from_0_to_100,
            evaluationAverage: 70,
            points: 30,
            onDelete: () {},
          ),
          5,
        ),
        buildAnimatedField(
          EmployeePointReportCard(
            enable: true,
            evaluationName: S.of(context).Marketing_Admission_Assessment,
            evaluationNumberName: S.of(context).Acceptance_rate_from_0_to_100,
            evaluationNumber: "50",
            evaluationAverageName: S.of(context).Acceptance_rate,
            evaluationAverage: 50,
            points: -4,
            onDelete: () {},
          ),
          6,
        ),
        buildAnimatedField(
          EmployeePointReportAddDeleteCard(
            number: "30",
            comment: "اقتراح مفيد للشركة",
            onDelete: () {},
          ),
          7,
        ),
      ],
    );
  }
}
