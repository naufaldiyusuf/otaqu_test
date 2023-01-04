part of '../views.dart';

class HomeScreen extends StatefulWidget {
  List<DestinationModelData> listDestination;
  List<String> listHistory;
  List<String> listHistoryId;

  HomeScreen(this.listDestination, this.listHistory, this.listHistoryId);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool cantSubmit = true;
  String? nameChoosen;
  int destinationId = 0;
  bool isLoading = false;

  List<Widget> listPromo = [
    Image.asset("assets/promo_first.png"),
    Image.asset("assets/promo_second.png"),
    Image.asset("assets/promo_third.png"),
    Image.asset("assets/promo_fourth.png"),
    Image.asset("assets/promo_fifth.jpeg")
  ];

  List<DestinationModelData> listDestination = [
    DestinationModelData(destinationId: 0, typeSource: "typeSource", typeName: "typeName", name: "name"),
    DestinationModelData(destinationId: 0, typeSource: "typeSource", typeName: "typeName", name: "plename")

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: isLoading ? 0.5 : 1,
            child: AbsorbPointer(
              absorbing: isLoading,
              child: ListView(
                padding: EdgeInsets.only(top: 40),
                children: [
                  Container(
                    color: MainColor.primaryBlueColor,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 20, left: 20, bottom: 40),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '“Live life with no excuses, travel with no regret” - Jo Walton',
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white
                          ),
                        ),
                      ],
                    ),
                  ),
                  promoScroll(listPromo, context),
                  Container(
                    margin: EdgeInsets.only(
                        top: 40,
                        bottom: 60,
                        left: 20,
                        right: 20
                    ),
                    padding: EdgeInsets.symmetric(vertical: 35),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                            "Kamu lagi mau",
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)
                        ),
                        Text(
                            "liburan kemana?",
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 23, top: 70, bottom: 5),
                          child: Text("Tujuan Wisata"),
                        ),
                        autoCompleteTextFieldCustom(
                            widget.listDestination,
                                (selection) {
                              cantSubmit = false;
                              destinationId = selection.destinationId;
                              nameChoosen = selection.name;
                              setState(() {});
                            },
                                (value) {
                              if (nameChoosen != value) {
                                cantSubmit = true;
                                setState(() {});
                              }
                            }
                        ),
                        buttonAll(
                            marginTop: 20,
                            marginRight: 20,
                            marginLeft: 23,
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            text: "Ayo Cari",
                            cantSubmit: cantSubmit,
                            onPressed: () {
                              isLoading = true;
                              setState(() {});

                              Method.getAvailData(
                                  destinationId,
                                  context,
                                  nameChoosen!,
                                      () {
                                    isLoading = false;
                                    setState(() {});
                                  }
                              );
                            }),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text("Pencarian Terakhir"),
                  ),
                  widget.listHistory.isNotEmpty
                      ? SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: widget.listHistory.asMap().map((i, e) => MapEntry(i,
                          GestureDetector(
                            onTap: () {
                              isLoading = true;
                              setState(() {});

                              Method.getAvailData(
                                  int.parse(widget.listHistoryId[i]),
                                  context,
                                  e,
                                      () {
                                    isLoading = false;
                                    setState(() {});
                                  }
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(8.0)
                              ),
                              width: 130,
                              margin: EdgeInsets.only(left: 5, top: 8),
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              child: Row(
                                children: [
                                  Icon(Icons.search),
                                  Padding(
                                    padding: EdgeInsets.only(left: 3),
                                    child: Container(
                                      width: 81,
                                      child: Text(
                                        e,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                      )).values.toList(),
                    ),
                  )
                      : Container(
                    decoration: BoxDecoration(
                        border: Border.all()
                    ),
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 8),
                    padding: EdgeInsets.symmetric(vertical: 25),
                    child: Text("Belum ada pencarian"),
                  )

                ],
              ),
            ),
          ),
          Center(
            child: Opacity(
              opacity: isLoading ? 1.0 : 0,
              child: CircularProgressIndicator(
                color: MainColor.primaryBlueColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}

