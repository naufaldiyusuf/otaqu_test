part of 'helpers.dart';

class Method {
  static void getAvailData(int destinationId, BuildContext context, String name, Function() error) async {
    final prefs =  await SharedPreferences.getInstance();
    final responseAvail = await AvailServices.getAvail(destinationId);
    List<String> listHistory = prefs.getStringList(Constant.listHistory) ?? [];
    List<String> listHistoryId = prefs.getStringList(Constant.listHistoryId) ?? [];

    if (responseAvail.code == 200) {
      for (int i = 0; i < listHistory.length; i++) {
        if (listHistory[i] == name) {
          listHistory.removeAt(i);
        }
      }

      for (int i = 0; i < listHistoryId.length; i++) {
        if (int.parse(listHistoryId[i]) == destinationId) {
          listHistoryId.removeAt(i);
        }
      }
      listHistory.add(name);
      listHistoryId.add(destinationId.toString());
      prefs.setStringList(Constant.listHistory, listHistory);
      prefs.setStringList(Constant.listHistoryId, listHistoryId);

      context.read<PageBloc>().add(GoToAvailPage(name, responseAvail.packages));
    } else if (responseAvail.code == 401) {
      final responseBearer = await BearerServices.getBearerToken();
      if (responseBearer.code == 200) {
        prefs.setString(Constant.bearerToken, responseBearer.token);
      }
      getAvailData(destinationId, context, name, error);
    } else {
      error();
    }
  }
}