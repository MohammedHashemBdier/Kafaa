import 'package:flutter/material.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/app_styles.dart';
import 'package:kafaa_app/widgets/custom_app_text_fields_border.dart';

class WorkStatetDropdownList extends StatefulWidget {
  const WorkStatetDropdownList({super.key, required this.enabled, this.label});
  final bool enabled;
  final String? label;
  @override
  _WorkStatetDropdownListState createState() => _WorkStatetDropdownListState();
}

class _WorkStatetDropdownListState extends State<WorkStatetDropdownList> {
  late String? selectedValue;
  late List<String> workState;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    workState = [
      S.of(context).work,
      S.of(context).not_work,
    ];
    selectedValue = workState[0];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        elevation: 3,
        child: DropdownButtonFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.work_outline,
              color: AppColors.c5,
            ),
            labelText: widget.label ?? S.of(context).work_state,
            labelStyle: AppStyles.styleRegular16(context),
            hintText: S.of(context).add_work_state,
            hintStyle: AppStyles.styleRegular16(context).copyWith(
              color: AppColors.c5,
            ),
            fillColor: AppColors.c3,
            filled: true,
            border: CustomAppTextFieldsBorder.appTextFieldsBorder(),
            enabledBorder: CustomAppTextFieldsBorder.appTextFieldsBorder(),
          ),
          value: widget.enabled ? selectedValue : null,
          items: workState.map(
            (e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e),
              );
            },
          ).toList(),
          onChanged: widget.enabled
              ? (val) {
                  setState(() {
                    selectedValue = val as String?;
                  });
                }
              : null,
        ),
      ),
    );
  }
}
