import 'package:flutter/material.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/widgets/login_page/login_content.dart';

class LoginTabletSection extends StatelessWidget {
  const LoginTabletSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: SizedBox()),
        Expanded(
          flex: 5,
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: PhysicalModel(
                  color: Colors.black,
                  elevation: 10,
                  shadowColor: AppColors.c1,
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    alignment: Alignment.topRight,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30),
                      ),
                      color: AppColors.c4,
                    ),
                    child: const LoginContent(),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Expanded(child: SizedBox()),
      ],
    );
  }
}
