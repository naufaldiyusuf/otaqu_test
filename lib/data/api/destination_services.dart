part of '../data.dart';

class DestinationServices {
  static Future<DestinationModel> getDestination() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String url = Constant.apiDestination;
    String token = prefs.getString(Constant.bearerToken) ?? "";
    var dio = Dio();

    final response = await dio.get(
        url,
        options: Options(
          validateStatus: (status) {
            return true;
          },
          headers: {
            "Content-Type": "application/json",
            'Authorization': 'Bearer $token'
          }
        )
    );

    return DestinationModel.fromJson(response.data);
  }
}