import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafaa_app/blocs/settings/settings_bloc.dart';
import 'package:kafaa_app/widgets/settings_page/change_password_section.dart';
import 'package:kafaa_app/widgets/settings_page/settings_section.dart';

class SettingsMobileLayout extends StatelessWidget {
  const SettingsMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        if (state is GetDataLoadedState)
          return const CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 40, bottom: 40, right: 20, left: 20),
                  child: Column(
                    children: [
                      SettingsSection(),
                      SizedBox(height: 20),
                      ChangePasswordSection(),
                    ],
                  ),
                ),
              )
            ],
          );
        return const SizedBox();
      },
    );
  }
}
