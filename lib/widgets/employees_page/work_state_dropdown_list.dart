import 'package:flutter/material.dart';
import 'package:kfaa_app/generated/l10n.dart';
import 'package:kfaa_app/utils/app_colors.dart';
import 'package:kfaa_app/utils/app_styles.dart';
import 'package:kfaa_app/widgets/app_text_fields_border.dart';

class WorkStatetDropdownList extends StatefulWidget {
  const WorkStatetDropdownList({super.key});

  @override
  _WorkStatetDropdownListState createState() => _WorkStatetDropdownListState();
}

class _WorkStatetDropdownListState extends State<WorkStatetDropdownList> {
  late String selectedValue;
  late List<String> workState;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // الحصول على القيم المترجمة عند تغيير السياق
    workState = [
      S.of(context).work,
      S.of(context).not_work,
    ];
    selectedValue = workState[0]; // تحديد القيمة الافتراضية
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        elevation: 3,
        child: DropdownButtonFormField(
          decoration: InputDecoration(
            prefix: Padding(
              padding: const EdgeInsets.only(right: 7, top: 8),
              child: Icon(
                Icons.work_outline,
                color: AppColors.c5,
              ),
            ),
            label: Text(
              S.of(context).work_state,
            ),
            labelStyle: AppStyles.styleRegular16(context),
            hintText: S.of(context).add_work_state,
            hintStyle: AppStyles.styleRegular16(context).copyWith(
              color: AppColors.c5,
            ),
            fillColor: AppColors.c3,
            filled: true,
            border: AppTextFieldsBorder.appTextFieldsBorder(),
            enabledBorder: AppTextFieldsBorder.appTextFieldsBorder(),
          ),
          value: selectedValue,
          items: workState.map(
            (e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e),
              );
            },
          ).toList(),
          onChanged: (val) {
            setState(() {
              selectedValue = val!;
            });
          },
        ),
      ),
    );
  }
}
