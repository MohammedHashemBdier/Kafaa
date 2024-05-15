import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kfaa_app/generated/l10n.dart';
import 'package:kfaa_app/utils/app_colors.dart';
import 'package:kfaa_app/views/login_view.dart';

void main() {
  return runApp(
    const KafaaApp(),
  );
}

class KafaaApp extends StatelessWidget {
  const KafaaApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale("en"),
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
      home: const LoginView(),
    );
  }
}
