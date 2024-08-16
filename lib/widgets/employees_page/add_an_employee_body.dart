import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kafaa_app/blocs/employees/add_employee/add_employee_bloc.dart';
import 'package:kafaa_app/helpers/extensions/date_extensions.dart';
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
        child: BlocBuilder<AddEmployeeBloc, AddEmployeeState>(
          buildWhen: (previous, current) => current is AddState,
          builder: (context, state) {
            return Form(
              key: state.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildAnimatedField(
                    CustomTextField(
                      prefixIcon: const Icon(Icons.person_sharp),
                      hint: S.of(context).add_name,
                      label: S.of(context).name,
                      controller: TextEditingController(),
                      validator: (value) => value == null || value.isEmpty
                          ? "S.of(context).this_field_is_required"
                          : null,
                      onChanged: (value) => context
                          .read<AddEmployeeBloc>()
                          .add(ChangeEmployeeName(name: value)),
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
                      controller: TextEditingController(),
                      validator: (value) => value == null || value.isEmpty
                          ? "S.of(context).this_field_is_required"
                          : null,
                      onChanged: (value) => context
                          .read<AddEmployeeBloc>()
                          .add(ChangeEmployeeUsername(username: value)),
                    ),
                    1,
                  ),
                  buildAnimatedField(
                    CustomPasswordField(
                      prefixIcon: const Icon(Icons.password),
                      hint: S.of(context).add_password,
                      label: S.of(context).password,
                      controller: TextEditingController(),
                      validator: (value) => value == null || value.isEmpty
                          ? "S.of(context).this_field_is_required"
                          : null,
                      onChanged: (value) => context
                          .read<AddEmployeeBloc>()
                          .add(ChangeEmployeePassword(password: value)),
                    ),
                    2,
                  ),
                  buildAnimatedField(
                    CustomTextField(
                      prefixIcon: const Icon(Icons.badge),
                      hint: S.of(context).add_department,
                      label: S.of(context).department,
                      controller: TextEditingController(),
                      validator: (value) => value == null || value.isEmpty
                          ? "S.of(context).this_field_is_required"
                          : null,
                      onChanged: (value) => context
                          .read<AddEmployeeBloc>()
                          .add(ChangeEmployeeDepartment(department: value)),
                    ),
                    3,
                  ),
                  buildAnimatedField(
                    CustomNumberField(
                      prefixIcon: const Icon(Icons.phone),
                      hint: S.of(context).add_phone_number,
                      label: S.of(context).phone_number,
                      controller: TextEditingController(),
                      maxLength: 10,
                      validator: (value) => value == null || value.isEmpty
                          ? "S.of(context).this_field_is_required"
                          : null,
                      onChanged: (value) => context
                          .read<AddEmployeeBloc>()
                          .add(ChangeEmployeePhoneNumber(phoneNumber: value)),
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
                      controller: TextEditingController(),
                      maxLength: 10,
                      validator: (value) => value == null || value.isEmpty
                          ? "S.of(context).this_field_is_required"
                          : null,
                      onChanged: (value) => context
                          .read<AddEmployeeBloc>()
                          .add(ChangeEmployeeMobileNumber(mobileNumber: value)),
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
                      validator: (value) => value == null || value.isEmpty
                          ? "S.of(context).this_field_is_required"
                          : null,
                      onChose: (value) => context.read<AddEmployeeBloc>().add(
                          ChangeEmployeeIsWork(
                              isWork: value == S.of(context).work)),
                    ),
                    6,
                  ),
                  buildAnimatedField(
                    BlocSelector<AddEmployeeBloc, AddEmployeeState, DateTime?>(
                      selector: (state) {
                        if (state is AddState) return null;
                        return state.employee.dateOfJoining;
                      },
                      builder: (context, date) {
                        return CustomTextField(
                          prefixIcon: const Icon(Icons.calendar_today),
                          hint: S.of(context).select_date,
                          label: S.of(context).date_of_joining_the_department,
                          readOnly: true,
                          controller: TextEditingController(
                              text: date?.commonDateFormat()),
                          validator: (value) => value == null || value.isEmpty
                              ? "S.of(context).this_field_is_required"
                              : null,
                          onTap: () async => context
                              .read<AddEmployeeBloc>()
                              .add(ChangeEmployeeDateOfJoining(
                                  dateOfJoining:
                                      await customSelectDate(context))),
                        );
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
                      controller: TextEditingController(),
                      validator: (value) => value == null || value.isEmpty
                          ? "S.of(context).this_field_is_required"
                          : null,
                      onChanged: (value) => context
                          .read<AddEmployeeBloc>()
                          .add(ChangeEmployeeIDNumber(idNumber: value)),
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
                      controller: TextEditingController(),
                      validator: (value) => value == null || value.isEmpty
                          ? "S.of(context).this_field_is_required"
                          : null,
                      onChanged: (value) => context
                          .read<AddEmployeeBloc>()
                          .add(ChangeEmployeeAddress(address: value)),
                    ),
                    9,
                  ),
                  buildAnimatedField(
                    BlocSelector<AddEmployeeBloc, AddEmployeeState, DateTime?>(
                      selector: (state) {
                        if (state is AddState) return null;
                        return state.employee.dateOfBirth;
                      },
                      builder: (context, date) {
                        return CustomTextField(
                          prefixIcon: const Icon(Icons.calendar_today),
                          hint: S.of(context).select_date,
                          label: S.of(context).date_of_birth,
                          readOnly: true,
                          controller: TextEditingController(
                              text: date?.commonDateFormat()),
                          validator: (value) => value == null || value.isEmpty
                              ? "S.of(context).this_field_is_required"
                              : null,
                          onTap: () async => context
                              .read<AddEmployeeBloc>()
                              .add(ChangeEmployeeDateOfBirth(
                                  dateOfBirth:
                                      await customSelectDate(context))),
                        );
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
                      controller: TextEditingController(),
                      validator: (value) => value == null || value.isEmpty
                          ? "S.of(context).this_field_is_required"
                          : null,
                      onChanged: (value) => context.read<AddEmployeeBloc>().add(
                          ChangeEmployeeAcademicSpecialization(
                              academicSpecialization: value)),
                    ),
                    11,
                  ),
                  const SizedBox(height: 20),
                  buildAnimatedField(
                    IntrinsicWidth(
                      child: AddAnEmployeeButton(
                          onPressed: () =>
                              context.read<AddEmployeeBloc>().add(AddEvent())),
                    ),
                    12,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
