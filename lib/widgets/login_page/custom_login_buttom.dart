import 'package:flutter/material.dart';
import 'package:kfaa_app/generated/l10n.dart';
import 'package:kfaa_app/utils/app_colors.dart';
import 'package:kfaa_app/utils/app_styles.dart';
import 'package:kfaa_app/views/employees_view.dart';

class CustomLoginButton extends StatelessWidget {
  const CustomLoginButton({
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
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => (const EmployeesView()),
            ),
          );
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(AppColors.c1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: PhysicalModel(
            color: const Color.fromARGB(0, 255, 255, 255),
            elevation: 10,
            borderRadius: BorderRadius.circular(12),
            child: Text(S.of(context).login,
                style: AppStyles.styleSemiBold24(context).copyWith(
                  color: AppColors.c2,
                )),
          ),
        ),
      ),
    );
  }
}
