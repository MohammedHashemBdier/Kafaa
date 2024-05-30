import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/widgets/custom_app_container.dart';
import 'package:kafaa_app/widgets/custom_dropdown_list.dart';
import 'package:kafaa_app/widgets/custom_number_field.dart';
import 'package:kafaa_app/widgets/custom_password_field.dart';
import 'package:kafaa_app/widgets/custom_text_field.dart';
import 'package:kafaa_app/widgets/custom_date_dialog.dart';
import 'package:kafaa_app/widgets/employees_page/add_an_employee_button.dart';

class AddAnEmployeeBody extends StatefulWidget {
  const AddAnEmployeeBody({super.key});

  @override
  AddAnEmployeeBodyState createState() => AddAnEmployeeBodyState();
}

class AddAnEmployeeBodyState extends State<AddAnEmployeeBody>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animations = List.generate(13, (index) {
      double start = index * 0.075;
      double end = start + 0.2;
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
    return Flexible(
      child: CustomAppContainer(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildAnimatedField(
              CustomTextField(
                prefixIcon: const Icon(Icons.person_sharp),
                hint: S.of(context).add_name,
                label: S.of(context).name,
              ),
              0,
            ),
            buildAnimatedField(
              CustomTextField(
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(10),
                  child: FaIcon(FontAwesomeIcons.at),
                ),
                hint: S.of(context).add_username,
                label: S.of(context).username,
              ),
              1,
            ),
            buildAnimatedField(
              CustomPasswordField(
                prefixIcon: const Icon(Icons.password),
                hint: S.of(context).add_password,
                label: S.of(context).password,
                onTap: () {},
              ),
              2,
            ),
            buildAnimatedField(
              CustomTextField(
                prefixIcon: const Icon(Icons.badge),
                hint: S.of(context).add_department,
                label: S.of(context).department,
              ),
              3,
            ),
            buildAnimatedField(
              CustomNumberField(
                prefixIcon: const Icon(Icons.phone),
                hint: S.of(context).add_phone_number,
                label: S.of(context).phone_number,
                maxLength: 10,
              ),
              4,
            ),
            buildAnimatedField(
              CustomNumberField(
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(10),
                  child: FaIcon(FontAwesomeIcons.mobileRetro),
                ),
                hint: S.of(context).add_mobile_number,
                label: S.of(context).mobile_number,
                maxLength: 10,
              ),
              5,
            ),
            buildAnimatedField(
              CustomDropdownList(
                menuItems: [
                  S.of(context).work,
                  S.of(context).not_work,
                ],
                label: S.of(context).work_state,
                hintText: S.of(context).add_work_state,
                icon: Icon(
                  Icons.work_outline,
                  color: AppColors.c5,
                ),
                enabled: true,
                onChose: (val) {},
              ),
              6,
            ),
            buildAnimatedField(
              CustomTextField(
                prefixIcon: const Icon(Icons.calendar_today),
                hint: S.of(context).select_date,
                label: S.of(context).date_of_joining_the_department,
                onTap: () {
                  customSelectDate(context);
                },
              ),
              7,
            ),
            buildAnimatedField(
              CustomNumberField(
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(10),
                  child: FaIcon(FontAwesomeIcons.idBadge),
                ),
                hint: S.of(context).add_id_number,
                label: S.of(context).id_number,
                maxLength: 11,
              ),
              8,
            ),
            buildAnimatedField(
              CustomTextField(
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(10),
                  child: FaIcon(FontAwesomeIcons.locationArrow),
                ),
                hint: S.of(context).add_address,
                label: S.of(context).address,
              ),
              9,
            ),
            buildAnimatedField(
              CustomTextField(
                prefixIcon: const Icon(Icons.calendar_today),
                hint: S.of(context).select_date,
                label: S.of(context).date_of_birth,
                onTap: () {
                  customSelectDate(context);
                },
              ),
              10,
            ),
            buildAnimatedField(
              CustomTextField(
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(10),
                  child: FaIcon(FontAwesomeIcons.book),
                ),
                hint: S.of(context).add_academic_specialization,
                label: S.of(context).academic_specialization,
              ),
              11,
            ),
            const SizedBox(height: 20),
            buildAnimatedField(
              IntrinsicWidth(
                child: AddAnEmployeeButton(onPressed: () {}),
              ),
              12,
            ),
          ],
        ),
      ),
    );
  }
}
