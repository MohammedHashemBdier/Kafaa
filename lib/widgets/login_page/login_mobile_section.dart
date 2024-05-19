import 'package:flutter/material.dart';
import 'package:kfaa_app/utils/app_colors.dart';
import 'package:kfaa_app/utils/app_images.dart';
import 'package:kfaa_app/widgets/login_page/custom_login_buttom.dart';
import 'package:kfaa_app/widgets/login_page/login_custom_text_field.dart';

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
      ],
    );
  }
}
