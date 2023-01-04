part of '../views.dart';

class AvailScreen extends StatefulWidget {
  String name;
  List<AvailModelPackages> packages;

  AvailScreen(this.name, this.packages);

  @override
  State<AvailScreen> createState() => _AvailScreenState();
}

class _AvailScreenState extends State<AvailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Column(
                children: [
                  Text(
                      "All result for ${widget.name}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  buttonAll(
                      marginTop: 5,
                      marginRight: 0,
                      marginLeft: 0,
                      text: "Balik ke halaman sebelumnya",
                      cantSubmit: false,
                      onPressed: () {
                        context.read<PageBloc>().add(GoToHomePage(context));
                      }
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.75,
              child: ListView(
                children: widget.packages.map((e) {
                  String destinations = "";
                  for (int i = 0; i < e.destinations.length; i++) {
                    if (i+1 == destinations.length) {
                      destinations += e.destinations[i];
                    } else {
                      destinations += "${e.destinations[i]}, ";
                    }
                  }
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.all(
                        Radius.circular(9.0),
                      ),
                    ),
                    margin: EdgeInsets.only(bottom: 20),
                    padding: EdgeInsets.only(
                        left: 10,
                        top: 10,
                        bottom: 10,
                        right: 10
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          child: e.images.isNotEmpty ? Image.network(e.images[0]) : Image.asset("assets/logo.png"),
                        ),
                        Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width * 0.38,
                                      child: Text(
                                        e.name,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold
                                        ),
                                      )
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on, size: 16,),
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.3,
                                        child: Text(
                                          destinations,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                          maxLines: 2,
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 20),
                                    width: MediaQuery.of(context).size.width * 0.38,
                                    alignment: Alignment.centerRight,
                                    child: Text("${e.currency} ${e.price}"),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

