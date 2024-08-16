import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kafaa_app/blocs/employees/show_edit_employee/show_edit_employee_bloc.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/app_images.dart';
import 'package:kafaa_app/utils/app_styles.dart';
import 'package:kafaa_app/widgets/custom_app_container.dart';
import 'package:kafaa_app/widgets/custom_confirmation_dialog.dart';

class EmployeeInfoHeader extends StatelessWidget {
  const EmployeeInfoHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Tooltip(
            message: S.of(context).edit,
            showDuration: const Duration(milliseconds: 700),
            waitDuration: const Duration(milliseconds: 700),
            child: IconButton(
              icon: const Icon(Icons.edit),
              iconSize: 30,
              onPressed: () => context
                  .read<ShowEditEmployeeBloc>()
                  .add(EnableDisableEditingEvent()),
            ),
          ),
          const Expanded(child: SizedBox()),
          Text(
            S.of(context).employee_info,
            style: AppStyles.styleBold24(context),
          ),
          const SizedBox(width: 10),
          SvgPicture.asset(
            Assets.imagesEmployeeAvatar,
            width: 50,
            height: 50,
            colorFilter: ColorFilter.mode(AppColors.c5, BlendMode.srcIn),
          ),
          const Expanded(child: SizedBox()),
          Tooltip(
            showDuration: const Duration(milliseconds: 700),
            waitDuration: const Duration(milliseconds: 700),
            message: S.of(context).delete,
            child: IconButton(
              icon: const Icon(Icons.delete),
              iconSize: 30,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext cnx) {
                    return CustomConfirmationDialog(
                      content:
                          S.of(context).do_you_want_to_delete_the_employee,
                      onConfirm: () {
                        Navigator.of(cnx).pop();
                        context
                            .read<ShowEditEmployeeBloc>()
                            .add(DeleteEmployeeEvent());
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
