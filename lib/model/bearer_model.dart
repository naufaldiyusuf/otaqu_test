part of 'models.dart';

class BearerModel {
  int code = 0;
  String message = "";
  String token = "";

  BearerModel({
    this.code = 0,
    this.message = "",
    this.token = ""
  });

  BearerModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json["message"];
    if (json['data'] != null) {
      token = json['data']['access_token'];
    }
  }
}