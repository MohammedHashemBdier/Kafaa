import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kafaa_app/blocks/employees/show_edit_employee/show_edit_employee_bloc.dart';
import 'package:kafaa_app/extensions/date_extensions.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/app_styles.dart';
import 'package:kafaa_app/widgets/custom_dropdown_list.dart';
import 'package:kafaa_app/widgets/custom_number_field.dart';
import 'package:kafaa_app/widgets/custom_password_field.dart';
import 'package:kafaa_app/widgets/custom_text_field.dart';
import 'package:kafaa_app/widgets/custom_date_dialog.dart';

class EmployeeInfoBody extends StatefulWidget {
  const EmployeeInfoBody({super.key});

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
    return BlocBuilder<ShowEditEmployeeBloc, ShowEditEmployeeState>(
      builder: (context, state) {
        if (state is ShowInfoState) {
          final employee = state.employee;
          final enabled = state .isEditingEnabled;

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
                  initialValue: employee.name ?? '',
                  enabled: enabled,
                  prefixIcon: const Icon(Icons.person_sharp),
                  hint: S.of(context).add_name,
                  // label: S.of(context).add_name,
                  onChanged: (value) => context
                      .read<ShowEditEmployeeBloc>()
                      .add(ChangeEmployeeName(name: value)),
                ),
                1,
              ),
              buildAnimatedField(
                Text(S.of(context).username,
                    style: AppStyles.styleBold16(context)),
                2,
              ),
              buildAnimatedField(
                CustomTextField(
                  initialValue: employee.username ?? '',
                  enabled: enabled,
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(10),
                    child: FaIcon(FontAwesomeIcons.at),
                  ),
                  hint: S.of(context).add_username,
                  // label: S.of(context).add_username,
                  onChanged: (value) => context
                      .read<ShowEditEmployeeBloc>()
                      .add(ChangeEmployeeUsername(username: value)),
                ),
                3,
              ),
              buildAnimatedField(
                Text(S.of(context).password,
                    style: AppStyles.styleBold16(context)),
                4,
              ),
              buildAnimatedField(
                CustomPasswordField(
                  initialValue: employee.password ?? '',
                  enabled: enabled,
                  prefixIcon: const Icon(Icons.password),
                  hint: S.of(context).add_password,
                  // label: S.of(context).add_password,
                  onChanged: (value) => context
                      .read<ShowEditEmployeeBloc>()
                      .add(ChangeEmployeePassword(password: value)),
                ),
                5,
              ),
              buildAnimatedField(
                Text(S.of(context).department,
                    style: AppStyles.styleBold16(context)),
                6,
              ),
              buildAnimatedField(
                CustomTextField(
                  initialValue: employee.department ?? '',
                  enabled: enabled,
                  prefixIcon: const Icon(Icons.badge),
                  hint: S.of(context).add_department,
                  // label: S.of(context).add_department,
                  onChanged: (value) => context
                      .read<ShowEditEmployeeBloc>()
                      .add(ChangeEmployeeDepartment(department: value)),
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
                  initialValue: employee.phoneNumber ?? '',
                  enabled: enabled,
                  prefixIcon: const Icon(Icons.phone),
                  hint: S.of(context).add_phone_number,
                  // label: S.of(context).add_phone_number,
                  onChanged: (value) => context
                      .read<ShowEditEmployeeBloc>()
                      .add(ChangeEmployeePhoneNumber(phoneNumber: value)),
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
                  initialValue: employee.mobileNumber ?? '',
                  enabled: enabled,
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(10),
                    child: FaIcon(FontAwesomeIcons.mobileRetro),
                  ),
                  hint: S.of(context).mobile_number,
                  // label: S.of(context).mobile_number,
                  onChanged: (value) => context
                      .read<ShowEditEmployeeBloc>()
                      .add(ChangeEmployeeMobileNumber(mobileNumber: value)),
                  maxLength: 10,
                ),
                11,
              ),
              buildAnimatedField(
                Text(S.of(context).work_state,
                    style: AppStyles.styleBold16(context)),
                12,
              ),
              buildAnimatedField(
                CustomDropdownList(
                  menuItems: [
                    S.of(context).work,
                    S.of(context).not_work,
                  ],
                  hintText: S.of(context).add_work_state,
                  // label: S.of(context).add_work_state,
                  icon: Icon(
                    Icons.work_outline,
                    color: AppColors.c5,
                  ),
                  selectedValue: (employee.isWork ?? false)
                      ? S.of(context).work
                      : S.of(context).not_work,
                  enabled: enabled,
                  onChose: (value) => context.read<ShowEditEmployeeBloc>().add(
                      ChangeEmployeeIsWork(
                          isWork: value == S.of(context).work)),
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
                  initialValue:
                      employee.dateOfJoining?.commonDateFormat() ?? '',
                  enabled: enabled,
                  prefixIcon: const Icon(Icons.calendar_today),
                  hint: S.of(context).select_date,
                  // label: S.of(context).select_date,
                  onTap: () async {
                    context.read<ShowEditEmployeeBloc>().add(
                        ChangeEmployeeDateOfJoining(
                            dateOfJoining: await customSelectDate(context)));
                  },
                ),
                15,
              ),
              buildAnimatedField(
                Text(S.of(context).id_number,
                    style: AppStyles.styleBold16(context)),
                16,
              ),
              buildAnimatedField(
                CustomNumberField(
                  initialValue: employee.idNumber ?? '',
                  enabled: enabled,
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(10),
                    child: FaIcon(FontAwesomeIcons.idBadge),
                  ),
                  hint: S.of(context).id_number,
                  // label: S.of(context).id_number,
                  onChanged: (value) => context
                      .read<ShowEditEmployeeBloc>()
                      .add(ChangeEmployeeIDNumber(idNumber: value)),
                  maxLength: 11,
                ),
                17,
              ),
              buildAnimatedField(
                Text(S.of(context).address,
                    style: AppStyles.styleBold16(context)),
                18,
              ),
              buildAnimatedField(
                CustomTextField(
                  initialValue: employee.address ?? '',
                  enabled: enabled,
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(10),
                    child: FaIcon(FontAwesomeIcons.locationArrow),
                  ),
                  hint: S.of(context).add_address,
                  // label: S.of(context).add_address,
                  onChanged: (value) => context
                      .read<ShowEditEmployeeBloc>()
                      .add(ChangeEmployeeAddress(address: value)),
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
                  initialValue: employee.dateOfBirth?.commonDateFormat() ?? '',
                  enabled: enabled,
                  prefixIcon: const Icon(Icons.calendar_today),
                  hint: S.of(context).select_date,
                  // label: S.of(context).select_date,
                  onTap: () async {
                    context.read<ShowEditEmployeeBloc>().add(
                        ChangeEmployeeDateOfBirth(
                            dateOfBirth: await customSelectDate(context)));
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
                  initialValue: employee.academicSpecialization ?? '',
                  enabled: enabled,
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(10),
                    child: FaIcon(FontAwesomeIcons.book),
                  ),
                  hint: S.of(context).add_academic_specialization,
                  // label: S.of(context).add_academic_specialization,
                  onChanged: (value) => context
                      .read<ShowEditEmployeeBloc>()
                      .add(ChangeEmployeeAcademicSpecialization(
                          academicSpecialization: value)),
                ),
                23,
              ),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}
