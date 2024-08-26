import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kafaa_app/blocs/auth/auth_bloc.dart';
import 'package:kafaa_app/blocs/localization/localization_bloc.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/bloc_observer.dart';
import 'package:kafaa_app/utils/dependency_injection.dart';
import 'package:kafaa_app/utils/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = AppBlocObserver();

  await dependencyInjection();

  // runApp(const KafaaApp());

  runApp(
    DevicePreview(
      enabled: !const bool.fromEnvironment('dart.vm.product'),
      builder: (context) => const KafaaApp(),
    ),
  );
}

class KafaaApp extends StatelessWidget {
  const KafaaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => locator<AuthBloc>()..add(OpenAppEvent()),
        ),
        BlocProvider<LocalizationBloc>(
          create: (context) =>
              locator<LocalizationBloc>()..add(GetAppLanguageEvent()),
        ),
      ],
      child: BlocSelector<LocalizationBloc, LocalizationState, String>(
        selector: (state) {
          return state.languageCode;
        },
        builder: (context, languageCode) {
          return MaterialApp(
            locale: Locale(languageCode),
            builder: (context, widget) => DevicePreview.appBuilder(
                context, widget), 
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            theme: ThemeData(
              primaryColor: customMaterialColors,
              fontFamily: "ElMessiri",
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.c1,
              ),
            ),
            debugShowCheckedModeBanner: false,
            color: Colors.black26,
            title: 'Kafa\'a App Dash Board',
            onGenerateRoute: AppRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
