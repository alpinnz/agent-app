import 'dart:convert';

import 'package:agent/core/app.dart';
import 'package:agent/features/authentication/model/user.model.dart';

class UserRepository {
  final prefs = App.main.sharedPreferences;

  static const String USER_KEY = 'USER_KEY';

  Future<void> saveUser(UserModel user) async {
    String userString = jsonEncode(user);

    await prefs.setString(USER_KEY, userString);

    return;
  }

  Future<UserModel> getUser() async {
    String userString = prefs.getString(USER_KEY);
    if (userString != null && userString.length > 0) {
      UserModel user = UserModel.fromJson(await jsonDecode(userString));
      return user;
    } else {
      return null;
    }
  }

  Future<void> deleteUser() async {
    await prefs.remove(USER_KEY);
    return;
  }
}
