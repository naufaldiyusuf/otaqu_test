part of '../../data.dart';

class DestinationRepository {
  final destinationDao = DestinationDao();

  Future insert(DestinationModelData model) =>destinationDao.insert(model);

  Future getList({int? id}) => destinationDao.getDestination();
}