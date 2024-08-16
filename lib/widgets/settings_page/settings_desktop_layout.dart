import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafaa_app/blocs/settings/settings_bloc.dart';
import 'package:kafaa_app/utils/router.dart';
import 'package:kafaa_app/widgets/drawer/app_drawer.dart';
import 'package:kafaa_app/widgets/settings_page/change_password_section.dart';
import 'package:kafaa_app/widgets/settings_page/settings_section.dart';

class SettingsDesktopLayout extends StatelessWidget {
  const SettingsDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: AppDrawer(route: AppRouter.settings)),
        const SizedBox(width: 30),
        Expanded(
          flex: 4,
          child: BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, state) {
              if (state is GetDataLoadedState)
                return const CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 40, bottom: 40, right: 20, left: 20),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: SettingsSection(),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: ChangePasswordSection(),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );

              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}
