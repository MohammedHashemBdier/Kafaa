import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kfaa_app/generated/l10n.dart';
import 'package:kfaa_app/widgets/custom_app_container.dart';
import 'package:kfaa_app/widgets/custom_number_field.dart';
import 'package:kfaa_app/widgets/custom_text_field.dart';
import 'package:kfaa_app/widgets/date_dialog.dart';
import 'package:kfaa_app/widgets/employees_page/add_an_employee_button.dart';
import 'package:kfaa_app/widgets/employees_page/work_state_dropdown_list.dart';

class AddAnEmployeeBody extends StatelessWidget {
  const AddAnEmployeeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: CustomAppContainer(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              prefixIcon: const Icon(Icons.person_sharp),
              hint: S.of(context).add_name,
              label: S.of(context).name,
            ),
            CustomTextField(
              prefixIcon: const Padding(
                padding: EdgeInsets.all(10),
                child: FaIcon(FontAwesomeIcons.at),
              ),
              hint: S.of(context).add_username,
              label: S.of(context).username,
            ),
            CustomTextField(
              prefixIcon: const Icon(Icons.password),
              hint: S.of(context).add_password,
              label: S.of(context).password,
            ),
            CustomTextField(
              prefixIcon: const Icon(Icons.badge),
              hint: S.of(context).add_department,
              label: S.of(context).department,
            ),
            CustomNumberField(
              prefixIcon: const Icon(Icons.phone),
              hint: S.of(context).add_phone_number,
              label: S.of(context).phone_number,
              maxLength: 10,
            ),
            CustomNumberField(
              prefixIcon: const Padding(
                padding: EdgeInsets.all(10),
                child: FaIcon(FontAwesomeIcons.mobileRetro),
              ),
              hint: S.of(context).add_mobile_number,
              label: S.of(context).mobile_number,
              maxLength: 10,
            ),
            const Flexible(
              child: WorkStatetDropdownList(),
            ),
            CustomTextField(
              prefixIcon: const Icon(Icons.calendar_today),
              hint: S.of(context).select_date,
              label: S.of(context).date_of_joining_the_department,
              onTap: () {
                selectDate(context);
              },
            ),
            CustomNumberField(
              prefixIcon: const Padding(
                padding: EdgeInsets.all(10),
                child: FaIcon(FontAwesomeIcons.idBadge),
              ),
              hint: S.of(context).add_id_number,
              label: S.of(context).id_number,
              maxLength: 11,
            ),
            CustomTextField(
              prefixIcon: const Padding(
                padding: EdgeInsets.all(10),
                child: FaIcon(FontAwesomeIcons.locationArrow),
              ),
              hint: S.of(context).add_address,
              label: S.of(context).address,
            ),
            CustomTextField(
              prefixIcon: const Icon(Icons.calendar_today),
              hint: S.of(context).select_date,
              label: S.of(context).date_of_birth,
              onTap: () {
                selectDate(context);
              },
            ),
            CustomTextField(
              prefixIcon: const Padding(
                padding: EdgeInsets.all(10),
                child: FaIcon(FontAwesomeIcons.pen),
              ),
              hint: S.of(context).add_academic_specialization,
              label: S.of(context).academic_specialization,
            ),
            const SizedBox(height: 20),
            IntrinsicWidth(child: AddAnEmployeeButton(onPressed: () {})),
          ],
        ),
      ),
    );
  }
}