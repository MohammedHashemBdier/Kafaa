import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_styles.dart';
import 'package:kafaa_app/widgets/custom_number_field.dart';
import 'package:kafaa_app/widgets/custom_text_field.dart';
import 'package:kafaa_app/widgets/custom_date_dialog.dart';
import 'package:kafaa_app/widgets/employees_page/work_state_dropdown_list.dart';

class EmployeeInfoBody extends StatelessWidget {
  const EmployeeInfoBody({
    super.key,
    required this.enabled,
  });
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(S.of(context).name, style: AppStyles.styleBold16(context)),
        CustomTextField(
          label: "Mohammed Hashem Bdier",
          enabled: enabled,
          prefixIcon: const Icon(Icons.person_sharp),
          hint: S.of(context).add_name,
        ),
        Text(S.of(context).username, style: AppStyles.styleBold16(context)),
        CustomTextField(
          label: "mhb2003",
          enabled: enabled,
          prefixIcon: const Padding(
            padding: EdgeInsets.all(10),
            child: FaIcon(FontAwesomeIcons.at),
          ),
          hint: S.of(context).add_username,
        ),
        Text(S.of(context).password, style: AppStyles.styleBold16(context)),
        CustomTextField(
          label: "1@23456",
          enabled: enabled,
          prefixIcon: const Icon(Icons.password),
          hint: S.of(context).add_password,
        ),
        Text(S.of(context).department, style: AppStyles.styleBold16(context)),
        CustomTextField(
          label: "Tech",
          enabled: enabled,
          prefixIcon: const Icon(Icons.badge),
          hint: S.of(context).add_department,
        ),
        Text(S.of(context).phone_number, style: AppStyles.styleBold16(context)),
        CustomNumberField(
          label: "0113344250",
          enabled: enabled,
          prefixIcon: const Icon(Icons.phone),
          hint: S.of(context).add_phone_number,
          maxLength: 10,
        ),
        Text(S.of(context).mobile_number,
            style: AppStyles.styleBold16(context)),
        CustomNumberField(
          label: "0997629626",
          enabled: enabled,
          prefixIcon: const Padding(
            padding: EdgeInsets.all(10),
            child: FaIcon(FontAwesomeIcons.mobileRetro),
          ),
          hint: S.of(context).mobile_number,
          maxLength: 10,
        ),
        Text(S.of(context).work_state, style: AppStyles.styleBold16(context)),
        Flexible(
          child: WorkStatetDropdownList(
            label: S.of(context).work,
            enabled: enabled,
          ),
        ),
        Text(S.of(context).date_of_joining_the_department,
            style: AppStyles.styleBold16(context)),
        CustomTextField(
          label: "11/9/2022",
          enabled: enabled,
          prefixIcon: const Icon(Icons.calendar_today),
          hint: S.of(context).select_date,
          onTap: () {
            customSelectDate(context);
          },
        ),
        Text(S.of(context).id_number, style: AppStyles.styleBold16(context)),
        CustomNumberField(
          label: "01010548972",
          enabled: enabled,
          prefixIcon: const Padding(
            padding: EdgeInsets.all(10),
            child: FaIcon(FontAwesomeIcons.idBadge),
          ),
          hint: S.of(context).id_number,
          maxLength: 11,
        ),
        Text(S.of(context).address, style: AppStyles.styleBold16(context)),
        CustomTextField(
          label: "دمشق المهاجرين باشكاتب",
          enabled: enabled,
          prefixIcon: const Padding(
            padding: EdgeInsets.all(10),
            child: FaIcon(FontAwesomeIcons.locationArrow),
          ),
          hint: S.of(context).add_address,
        ),
        Text(S.of(context).date_of_birth,
            style: AppStyles.styleBold16(context)),
        CustomTextField(
          label: "31/10/2003",
          enabled: enabled,
          prefixIcon: const Icon(Icons.calendar_today),
          hint: S.of(context).select_date,
          onTap: () {
            customSelectDate(context);
          },
        ),
        Text(S.of(context).academic_specialization,
            style: AppStyles.styleBold16(context)),
        CustomTextField(
          label: "Information Engineering",
          enabled: enabled,
          prefixIcon: const Padding(
            padding: EdgeInsets.all(10),
            child: FaIcon(FontAwesomeIcons.book),
          ),
          hint: S.of(context).add_academic_specialization,
        ),
      ],
    );
  }
}
