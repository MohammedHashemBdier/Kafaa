import 'package:kafaa_app/utils/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
//   static const String _userKey = 'USER';

  final DioClient client;
  final SharedPreferences pref;

  AuthRepo({required this.client, required this.pref});

//   final _controller = StreamController<bool>();

//   Stream<bool> get isAuthenticated async* {
//     yield user?.token != null;
//     yield* _controller.stream;
//   }

//   UserModel? get user {
//     String? json = pref.getString(_userKey);
//     return json == null ? null : UserModel.fromJson(jsonDecode(json));
//   }

//   String? get token => user?.token;

//   Future<UserModel> login(String username, String password) async {
//     Map<String, dynamic> response = await client.post(
//       'teachers/login',
//       data: {'username': username, 'password': password},
//     );

//     UserModel user = UserModel.fromJson(response['teacher']);
//     pref.setString(_userKey, jsonEncode(user.toJson()));
//     _controller.add(true);
//     return user;
//   }

//   void logout() {
//     pref.remove(_userKey);
//     _controller.add(false);
//   }

//   void dispose() => _controller.close();
}
