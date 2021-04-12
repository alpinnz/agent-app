import 'package:agent/features/authentication/model/user.model.dart';

class LoginModel {
  bool succes;
  String message;
  UserModel user;
  String token;

  LoginModel({this.succes, this.message, this.user, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    succes = json['succes'];
    message = json['message'];
    user = json['user'] != null ? new UserModel.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['succes'] = this.succes;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}
