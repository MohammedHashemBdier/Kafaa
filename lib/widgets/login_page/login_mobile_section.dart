import 'package:flutter/material.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/widgets/login_page/login_content.dart';

class LoginMobileSection extends StatelessWidget {
  const LoginMobileSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(child: SizedBox()),
        Expanded(
          flex: 8,
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: PhysicalModel(
                  color: Colors.black12,
                  elevation: 10,
                  shadowColor: AppColors.c1,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    alignment: Alignment.topRight,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
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
      ],
    );
  }
}
