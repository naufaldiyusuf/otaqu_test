part of '../data.dart';

class BearerServices {
  static Future<BearerModel> getBearerToken() async {
    try {
      String url = Constant.apiBearer;
      var dio = Dio();

      final response = await dio.post(
          url,
          data: {
            "username": "otaqu",
            "password": "qwerty"
          },
          options: Options(
            validateStatus: (status) {
              return true;
            },
          )
      );

      return BearerModel.fromJson(response.data);
    } catch (e) {
      print(e.toString());
      return BearerModel();
    }
  }
}