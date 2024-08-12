import 'package:flutter/material.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/app_styles.dart';
import 'package:kafaa_app/views/login_view.dart';
import 'package:kafaa_app/widgets/custom_confirmation_dialog.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.black12,
      elevation: 10,
      shadowColor: AppColors.c1,
      borderRadius: BorderRadius.circular(50),
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomConfirmationDialog(
                content: S.of(context).do_you_want_to_logout,
                onConfirm: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => (const LoginView()),
                    ),
                  );
                },
              );
            },
          );
        },
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          backgroundColor: WidgetStateProperty.all<Color>(AppColors.c1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: PhysicalModel(
            color: const Color.fromARGB(0, 255, 255, 255),
            elevation: 10,
            borderRadius: BorderRadius.circular(12),
            child: Text(S.of(context).logout,
                style: AppStyles.styleSemiBold24(context).copyWith(
                  color: AppColors.c2,
                )),
          ),
        ),
      ),
    );
  }
}
