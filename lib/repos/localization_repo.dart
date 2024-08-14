import 'package:kafaa_app/utils/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationRepo {
  static const String _languageKey = 'LANGUAGE';

  final SharedPreferences pref;
  final DioClient client;

  LocalizationRepo({required this.pref, required this.client});

  String? get languageCode => pref.getString(_languageKey);

  Future<bool> changeLanguage(String languageCode) async {
    Map<String, dynamic> response = await client.get(
      'greeting/$languageCode',
      password: '12345678',
    );

    bool isChanged = response['status'];
    if (isChanged) pref.setString(_languageKey, languageCode);
    return isChanged;
  }
}
