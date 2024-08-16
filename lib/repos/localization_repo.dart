import 'package:kafaa_app/utils/dio_client.dart';

class LocalizationRepo {
  final DioClient client;

  LocalizationRepo({required this.client});

  Future<String> get languageCode async {
    Map<String, dynamic> response = await client.get('language/get');
    return response['data'];
  }

  Future<bool> changeLanguage(String languageCode) async {
    Map<String, dynamic> response = await client.get('greeting/$languageCode');
    return response['status'];
  }
}
