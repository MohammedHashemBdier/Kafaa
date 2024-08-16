import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafaa_app/blocs/settings/settings_bloc.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_styles.dart';
import 'package:kafaa_app/widgets/custom_app_container.dart';
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
      child: BlocBuilder<SettingsBloc, SettingsState>(
        buildWhen: (previous, current) => current is ChangePasswordSuccessState,
        builder: (context, state) {
          return Form(
            key: (state as GetDataLoadedState).formKey,
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
                    hint: S.of(context).add_password,
                    controller: TextEditingController(),
                    validator: (value) => value == null || value.isEmpty
                        ? S.of(context).This_field_is_required
                        : null,
                    onChanged: (value) => context
                        .read<SettingsBloc>()
                        .add(ChangeOldPasswordEvent(password: value)),
                  ),
                  1,
                ),
                const SizedBox(height: 5),
                buildAnimatedField(
                  Text(S.of(context).new_password,
                      style: AppStyles.styleBold16(context)),
                  2,
                ),
                buildAnimatedField(
                  CustomPasswordField(
                    label: S.of(context).new_password,
                    hint: S.of(context).add_password,
                    controller: TextEditingController(),
                    validator: (value) => value == null || value.isEmpty
                        ? S.of(context).This_field_is_required
                        : null,
                    onChanged: (value) => context
                        .read<SettingsBloc>()
                        .add(ChangeNewPasswordEvent(password: value)),
                  ),
                  3,
                ),
                const SizedBox(height: 5),
                buildAnimatedField(
                  Align(
                    alignment: Alignment.center,
                    child: IntrinsicWidth(
                      child: CustomSaveEditsButton(
                        onPressed: () => context
                            .read<SettingsBloc>()
                            .add(ChangePasswordEvent()),
                        enabled: true,
                      ),
                    ),
                  ),
                  4,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
