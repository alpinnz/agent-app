import 'package:agent/core/app.dart';
import 'package:agent/core/helper/api.helper.dart';
import 'package:agent/features/authentication/model/login.model.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationRepository {
  ApiHelper api = ApiHelper();
  final prefs = App.main.sharedPreferences;
  static const String TOKEN_KEY = 'TOKEN_KEY';

  Future<dynamic> login({
    @required String username,
    @required String password,
  }) async {
    String _url = '/api/user/login';
    final _data = {"UserName": "$username", "Password": "$password"};
    final response = await api.postHTTP(_url, _data);
    if (response == null) return null;
    if (response.data == null) return null;
    LoginModel loginModel = LoginModel.fromJson(response.data);
    return loginModel;
  }

  Future<void> deleteToken() async {
    prefs.clear();
    return;
  }

  Future<void> persistToken(String token) async {
    await prefs.setString(TOKEN_KEY, token);
    return;
  }

  Future<bool> hasToken() async {
    String token = prefs.getString(TOKEN_KEY);
    if (token != null && token.length > 10) {
      print(token);
      return true;
    }
    return false;
  }

  Future<String> getToken() async {
    String token = prefs.getString(TOKEN_KEY);
    return token;
  }
}
