import 'package:recipbook/services/http_service.dart';

import '../models/user.dart';

class AuthService {
  static final AuthService _singlton = AuthService._internal();

  final _HttpService = HttpService();
  User? user;

  factory AuthService() {
    return _singlton;
  }

  AuthService._internal();

  Future<bool> login(String username, String password) async {
    try {
      var response = await _HttpService.post(
          "auth/login", {"username": username, "password": password});
      if (response!.statusCode == 200 && response.statusCode != null) {
        user = User.fromJson(response.data);
        HttpService().setup(bearerToken: user!.token);
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }
}