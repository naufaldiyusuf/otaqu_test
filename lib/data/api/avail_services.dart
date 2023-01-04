part of '../data.dart';

class AvailServices {
  static Future<AvailModel> getAvail(int destinationId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String url = Constant.apiAvail;
    String token = prefs.getString(Constant.bearerToken) ?? "";
    var dio = Dio();

    final response = await dio.post(
        url,
        data: {
          "type_source": "location",
          "type_id":3,
          "destination_id": destinationId,
          "min_price": 0,
          "max_price": 10000000000,
          "page": 1,
          "order_by": "lowest",
          "reference": "search"
        },
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

    return AvailModel.fromJson(response.data);
  }
}