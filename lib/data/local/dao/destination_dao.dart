part of '../../data.dart';

class DestinationDao {
  final provider = LocalDB.provider;

  Future<int> insert(DestinationModelData model) async {
    final db = await provider.database;

    return await db!.transaction((txn) async {
      return await txn.insert("destination", model.toJson());
    });
  }

  Future<List<DestinationModelData?>> getDestination() async {
    final db = await provider.database;

    return await db!.transaction((trx) async {
      var result = await trx.rawQuery("SELECT * FROM destination");

      List<DestinationModelData> requests = [];

      if (result.isNotEmpty) {
        result.map((e) => requests.add(DestinationModelData.fromJson(e))).toList();
      }

      return requests;
    });
  }

  Future<List<DestinationModelData?>> getDestinationWithParameter() async {
    final db = await provider.database;

    return await db!.transaction((trx) async {
      var result = await trx.rawQuery("SELECT * FROM destination WHERE ");

      List<DestinationModelData> requests = [];

      if (result.isNotEmpty) {
        result.map((e) => requests.add(DestinationModelData.fromJson(e))).toList();
      }

      return requests;
    });
  }
}