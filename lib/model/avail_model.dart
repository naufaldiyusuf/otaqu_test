part of 'models.dart';

class AvailModel {
  int code = 0;
  bool status = false;
  String message = "";
  List<AvailModelPackages> packages = [];

  AvailModel({
    this.code = 0,
    this.status = false,
    this.message = "",
    this.packages = const []
  });

  AvailModel.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    status = json["status"];
    message = json["message"];

    if (json['data'] != null) {
      if (json['data']['packages'] != null) {
        json['data']['packages'].forEach((e) {
          packages.add(AvailModelPackages.fromJson(e));
        });
      }
    }
  }
}

class AvailModelPackages {
  int packageId = 0;
  String name = "";
  int price = 0;
  String currency = "";
  int day = 0;
  String operationTimeIn = "";
  String operationTimeOut = "";
  String timeZone = "";
  List<String> images = [];
  List<String> destinations = [];

  AvailModelPackages({
    this.packageId = 0,
    this.name = "",
    this.price = 0,
    this.currency = "",
    this.day = 0,
    this.operationTimeIn = "",
    this.operationTimeOut = "",
    this.timeZone = "",
    this.images = const [],
    this.destinations = const []
  });

  AvailModelPackages.fromJson(Map<String, dynamic> json) {
    packageId = json['package_id'];
    name = json['name'];
    price = json['price'];
    currency = json['currency'];
    day = json['day'];
    operationTimeIn = json['operation_time_in'];
    operationTimeOut = json['operation_time_out'];
    timeZone = json['time_zone'];

    if (json['images'] != null) {
      json['images'].forEach((e) {
        images.add(e);
      });
    }

    if (json['destinations'] != null) {
      json['destinations'].forEach((e) {
        destinations.add(e['name']);
      });
    }
  }
}