import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafaa_app/blocs/auth/auth_bloc.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/app_styles.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.black12,
      elevation: 10,
      shadowColor: AppColors.c1,
      borderRadius: BorderRadius.circular(50),
      child: ElevatedButton(
        onPressed: () => context.read<AuthBloc>().add(LoggedInEvent()),
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
