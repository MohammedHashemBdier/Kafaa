import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/app_styles.dart';
import 'package:kafaa_app/widgets/custom_dropdown_list.dart';
import 'package:kafaa_app/widgets/custom_number_field.dart';
import 'package:kafaa_app/widgets/custom_password_field.dart';
import 'package:kafaa_app/widgets/custom_text_field.dart';
import 'package:kafaa_app/widgets/custom_date_dialog.dart';

class EmployeeInfoBody extends StatefulWidget {
  const EmployeeInfoBody({
    super.key,
    required this.enabled,
  });

  final bool enabled;

  @override
  EmployeeInfoBodyState createState() => EmployeeInfoBodyState();
}

class EmployeeInfoBodyState extends State<EmployeeInfoBody>
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
    _animations = List.generate(24, (index) {
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
          Text(S.of(context).name, style: AppStyles.styleBold16(context)),
          0,
        ),
        buildAnimatedField(
          CustomTextField(
            label: "Mohammed Hashem Bdier",
            enabled: widget.enabled,
            prefixIcon: const Icon(Icons.person_sharp),
            hint: S.of(context).add_name,
          ),
          1,
        ),
        buildAnimatedField(
          Text(S.of(context).username, style: AppStyles.styleBold16(context)),
          2,
        ),
        buildAnimatedField(
          CustomTextField(
            label: "mhb2003",
            enabled: widget.enabled,
            prefixIcon: const Padding(
              padding: EdgeInsets.all(10),
              child: FaIcon(FontAwesomeIcons.at),
            ),
            hint: S.of(context).add_username,
          ),
          3,
        ),
        buildAnimatedField(
          Text(S.of(context).password, style: AppStyles.styleBold16(context)),
          4,
        ),
        buildAnimatedField(
          CustomPasswordField(
            label: "1@23456",
            enabled: widget.enabled,
            prefixIcon: const Icon(Icons.password),
            hint: S.of(context).add_password,
            onTap: () {},
          ),
          5,
        ),
        buildAnimatedField(
          Text(S.of(context).department, style: AppStyles.styleBold16(context)),
          6,
        ),
        buildAnimatedField(
          CustomTextField(
            label: "Tech",
            enabled: widget.enabled,
            prefixIcon: const Icon(Icons.badge),
            hint: S.of(context).add_department,
          ),
          7,
        ),
        buildAnimatedField(
          Text(S.of(context).phone_number,
              style: AppStyles.styleBold16(context)),
          8,
        ),
        buildAnimatedField(
          CustomNumberField(
            label: "0113344250",
            enabled: widget.enabled,
            prefixIcon: const Icon(Icons.phone),
            hint: S.of(context).add_phone_number,
            maxLength: 10,
          ),
          9,
        ),
        buildAnimatedField(
          Text(S.of(context).mobile_number,
              style: AppStyles.styleBold16(context)),
          10,
        ),
        buildAnimatedField(
          CustomNumberField(
            label: "0997629626",
            enabled: widget.enabled,
            prefixIcon: const Padding(
              padding: EdgeInsets.all(10),
              child: FaIcon(FontAwesomeIcons.mobileRetro),
            ),
            hint: S.of(context).mobile_number,
            maxLength: 10,
          ),
          11,
        ),
        buildAnimatedField(
          Text(S.of(context).work_state, style: AppStyles.styleBold16(context)),
          12,
        ),
        buildAnimatedField(
          CustomDropdownList(
            menuItems: [
              S.of(context).work,
              S.of(context).not_work,
            ],
            label: S.of(context).work,
            hintText: S.of(context).add_work_state,
            icon: Icon(
              Icons.work_outline,
              color: AppColors.c5,
            ),
            enabled: false,
            onChose: (val) {},
          ),
          13,
        ),
        buildAnimatedField(
          Text(S.of(context).date_of_joining_the_department,
              style: AppStyles.styleBold16(context)),
          14,
        ),
        buildAnimatedField(
          CustomTextField(
            label: "11/9/2022",
            enabled: widget.enabled,
            prefixIcon: const Icon(Icons.calendar_today),
            hint: S.of(context).select_date,
            onTap: () {
              customSelectDate(context);
            },
          ),
          15,
        ),
        buildAnimatedField(
          Text(S.of(context).id_number, style: AppStyles.styleBold16(context)),
          16,
        ),
        buildAnimatedField(
          CustomNumberField(
            label: "01010548972",
            enabled: widget.enabled,
            prefixIcon: const Padding(
              padding: EdgeInsets.all(10),
              child: FaIcon(FontAwesomeIcons.idBadge),
            ),
            hint: S.of(context).id_number,
            maxLength: 11,
          ),
          17,
        ),
        buildAnimatedField(
          Text(S.of(context).address, style: AppStyles.styleBold16(context)),
          18,
        ),
        buildAnimatedField(
          CustomTextField(
            label: "دمشق المهاجرين باشكاتب",
            enabled: widget.enabled,
            prefixIcon: const Padding(
              padding: EdgeInsets.all(10),
              child: FaIcon(FontAwesomeIcons.locationArrow),
            ),
            hint: S.of(context).add_address,
          ),
          19,
        ),
        buildAnimatedField(
          Text(S.of(context).date_of_birth,
              style: AppStyles.styleBold16(context)),
          20,
        ),
        buildAnimatedField(
          CustomTextField(
            label: "31/10/2003",
            enabled: widget.enabled,
            prefixIcon: const Icon(Icons.calendar_today),
            hint: S.of(context).select_date,
            onTap: () {
              customSelectDate(context);
            },
          ),
          21,
        ),
        buildAnimatedField(
          Text(S.of(context).academic_specialization,
              style: AppStyles.styleBold16(context)),
          22,
        ),
        buildAnimatedField(
          CustomTextField(
            label: "Information Engineering",
            enabled: widget.enabled,
            prefixIcon: const Padding(
              padding: EdgeInsets.all(10),
              child: FaIcon(FontAwesomeIcons.book),
            ),
            hint: S.of(context).add_academic_specialization,
          ),
          23,
        ),
      ],
    );
  }
}
