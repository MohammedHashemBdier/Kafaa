import 'package:shared_preferences/shared_preferences.dart';

class LocalizationRepo {
  static const String _languageKey = 'LANGUAGE';

  final SharedPreferences pref;

  LocalizationRepo({required this.pref});

  String? get languageCode => pref.getString(_languageKey);

  void saveLanguageCode(String languageCode) =>
      pref.setString(_languageKey, languageCode);
}
