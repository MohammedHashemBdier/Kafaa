import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafaa_app/blocks/employees/show_edit_employee/show_edit_employee_bloc.dart';
import 'package:kafaa_app/models/employee_model.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/size_config.dart';
import 'package:kafaa_app/widgets/custom_app_container.dart';
import 'package:kafaa_app/widgets/custom_close_icon.dart';
import 'package:kafaa_app/widgets/employees_page/employee_info_body.dart';
import 'package:kafaa_app/widgets/employees_page/employee_info_header.dart';
import 'package:kafaa_app/widgets/custom_save_edits_button.dart';

class EmployeeInfoDialog extends StatelessWidget {
  final EmployeeModel employee;
  final void Function() onDelete;
  final void Function(EmployeeModel newEmployee) onEdit;

  const EmployeeInfoDialog({
    super.key,
    required this.employee,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShowEditEmployeeBloc>(
      create: (context) =>
          ShowEditEmployeeBloc()..add(GetEmployeeEvent(employee: employee)),
      child: BlocListener<ShowEditEmployeeBloc, ShowEditEmployeeState>(
        listener: (context, state) {
          if (state is DeleteState) {
            onDelete.call();
            Navigator.of(context).pop();
          }

          if (state is SaveState) {
            onEdit.call(state.employee);
          }
        },
        child: SizedBox(
          child: Dialog(
            elevation: 10,
            backgroundColor: AppColors.c2,
            child: SizedBox(
              width: SizeConfig.width < SizeConfig.desktop
                  ? MediaQuery.sizeOf(context).width * 0.8
                  : MediaQuery.sizeOf(context).width * 0.5,
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CustomCloseIcon(),
                          const EmployeeInfoHeader(),
                          const Flexible(
                            child: CustomAppContainer(
                              child: EmployeeInfoBody(),
                            ),
                          ),
                          const SizedBox(height: 10),
                          IntrinsicWidth(
                            child: CustomAppContainer(
                              child: BlocSelector<ShowEditEmployeeBloc,
                                  ShowEditEmployeeState, bool>(
                                selector: (state) => state is ShowInfoState
                                    ? state.isEditingEnabled
                                    : false,
                                builder: (context, enabled) {
                                  return CustomSaveEditsButton(
                                    enabled: enabled,
                                    onPressed: () {
                                      context
                                          .read<ShowEditEmployeeBloc>()
                                          .add(SaveEvent());
                                      Navigator.of(context).pop();
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
