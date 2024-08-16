import 'dart:async';

import 'package:kafaa_app/utils/constants.dart';
import 'package:kafaa_app/utils/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  static const String _passwordKey = 'PASSWORD';

  final DioClient client;
  final SharedPreferences pref;

  AuthRepo({required this.client, required this.pref});

  final _controller = StreamController<bool>();

  Stream<bool> get isAuthenticated async* {
    yield password != null;
    yield* _controller.stream;
  }

  String? get password => pref.getString(_passwordKey);

  Future<bool> login(String password) async {
    Map<String, dynamic> response = await client.post(
      'login',
      data: {'password': password},
    );

    bool isLogged = response['status'];
    if (!isLogged) return false;

    pref.setString(_passwordKey, password);
    _controller.add(true);
    return true;
  }

  void logout() async {
    _controller.add(false);
    String? password = this.password;
    pref.remove(_passwordKey);
    try {
      await client.get('out', password: password);
    } catch (e) {
      //
    }
  }

  Future<bool> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    Map<String, dynamic> response = await client.post(
      'password/change',
      password: oldPassword,
      data: {
        'old': oldPassword,
        'new': newPassword,
      },
    );

    bool isChanged = response['status'];
    if (isChanged) pref.setString(_passwordKey, newPassword);
    return true;
  }

  Future<JsonMap> getManagerDetails() async {
    Map<String, dynamic> response = await client.get(
      'maneger/get',
      password: password,
    );

    return response['data'];
  }

  void dispose() => _controller.close();
}
