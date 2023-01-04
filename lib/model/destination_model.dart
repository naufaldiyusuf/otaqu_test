part of 'models.dart';

class DestinationModel {
  int code = 0;
  bool status = false;
  String message = "";
  List<DestinationModelData> datas = [];

  DestinationModel({
    this.code = 0,
    this.status = false,
    this.message = "",
    this.datas = const []
  });

  DestinationModel.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    status = json["status"];
    message = json["message"];
    if (json["data"] != null) {
      datas = <DestinationModelData>[];
      json["data"].forEach((v) {
        datas.add(DestinationModelData.fromJson(v));
      });
    }
  }
}

class DestinationModelData {
  int destinationId = 0;
  String typeSource = "";
  String typeName = "";
  String name = "";

  DestinationModelData({
    required this.destinationId,
    required this.typeSource,
    required this.typeName,
    required this.name
  });

  DestinationModelData.fromJson(Map<String, dynamic> json) {
    destinationId = json['destination_id'];
    typeSource = json['type_source'];
    typeName = json['type_name'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {'destination_id': destinationId, 'type_source': typeSource, 'type_name': typeName, 'name': name};
  }
}