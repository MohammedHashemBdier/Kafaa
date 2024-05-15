import 'package:flutter/material.dart';
import 'package:kfaa_app/utils/app_colors.dart';
import 'package:kfaa_app/utils/app_images.dart';
import 'package:kfaa_app/widgets/login_page/custom_login_buttom.dart';
import 'package:kfaa_app/widgets/login_page/login_custom_text_field.dart';

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
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    alignment: Alignment.topRight,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50),
                      ),
                      color: AppColors.c4,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                            child: Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(100),
                            child: Image.asset(Assets.imagesKfaaAppLogoPng),
                          ),
                        )),
                        const CustomLoginTextField(),
                        const SizedBox(height: 20),
                        const CustomLoginButton(),
                        const SizedBox(height: 20),
                      ],
                    ),
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
