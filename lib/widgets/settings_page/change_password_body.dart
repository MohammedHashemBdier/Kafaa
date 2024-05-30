import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_styles.dart';
import 'package:kafaa_app/widgets/custom_app_container.dart';
import 'package:kafaa_app/widgets/custom_next_button.dart';
import 'package:kafaa_app/widgets/custom_password_field.dart';
import 'package:kafaa_app/widgets/custom_save_edits_button.dart';

class ChangePasswordBody extends StatefulWidget {
  const ChangePasswordBody({super.key});

  @override
  ChangePasswordBodyState createState() => ChangePasswordBodyState();
}

class ChangePasswordBodyState extends State<ChangePasswordBody>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animations = List.generate(6, (index) {
      double start = index * 0.1;
      double end = start + 0.2;
      return CurvedAnimation(
        parent: _controller,
        curve: Interval(start, end > 1.0 ? 1.0 : end, curve: Curves.easeInOut),
      );
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildAnimatedField(Widget child, int index) {
    return FadeTransition(
      opacity: _animations[index],
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.1),
          end: Offset.zero,
        ).animate(_animations[index]),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomAppContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildAnimatedField(
            Text(S.of(context).old_password,
                style: AppStyles.styleBold16(context)),
            0,
          ),
          buildAnimatedField(
            CustomPasswordField(
              label: S.of(context).old_password,
              enabled: true,
              hint: S.of(context).add_password,
              onTap: () {},
            ),
            1,
          ),
          const SizedBox(height: 5),
          buildAnimatedField(
            Align(
              alignment: Alignment.center,
              child: IntrinsicWidth(
                child: CustomNextButton(
                  onPressed: () {},
                  enabled: true,
                ),
              ),
            ),
            2,
          ),
          const SizedBox(height: 20),
          buildAnimatedField(
            Text(S.of(context).new_password,
                style: AppStyles.styleBold16(context)),
            3,
          ),
          buildAnimatedField(
            CustomPasswordField(
              label: S.of(context).new_password,
              enabled: false,
              hint: S.of(context).add_password,
              onTap: () {},
            ),
            4,
          ),
          const SizedBox(height: 5),
          buildAnimatedField(
            Align(
              alignment: Alignment.center,
              child: IntrinsicWidth(
                child: CustomSaveEditsButton(
                  onPressed: () {},
                  enabled: false,
                ),
              ),
            ),
            5,
          ),
        ],
      ),
    );
  }
}
