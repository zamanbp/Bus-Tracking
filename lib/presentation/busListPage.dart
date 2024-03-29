import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:major_project/presentation/busRoute.dart';
import 'package:major_project/dartdrawer_utils.dart';
import 'package:major_project/liveBus.dart';
import 'package:major_project/model/busByStopsModel.dart';
import 'package:major_project/model/commonList.dart';
import 'package:major_project/services/addnotificationApi.dart';
import 'package:major_project/services/getBusstopbyrouteId.dart';
import 'package:major_project/services/getbuscurrentlocation.dart';
import 'package:major_project/services/stoporderbyroute.dart';

class BusListPage extends StatefulWidget {
  String? starting;
  String? ending;
  final List<BusByStops>? busList;
  String? status;
  BusListPage(
      {super.key, this.busList, this.status, this.starting, this.ending});

  @override
  State<BusListPage> createState() => _BusListPageState();
}

class _BusListPageState extends State<BusListPage> {
  ValueNotifier<String> dropdownvalue = ValueNotifier('Kozhikode');
  TextEditingController busname = TextEditingController();
  int? _selectedStopId;
  //Text editing controller for search button
  @override
  Widget build(BuildContext context) {
    TextEditingController startingpoint =
        TextEditingController(text: widget.starting);
    TextEditingController endingpoint =
        TextEditingController(text: widget.ending);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 3, 28, 104),
        title: Text(
          'Bus Tracking',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      drawer: buildDrawer(context),
      body: widget.busList == null
          ? Center(
              child: Text("Sorry no buses found"),
            )
          : Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  height: 150,
                  width: 320,
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 25, left: 25, right: 25),
                        child: CupertinoTextField(
                          controller: startingpoint,
                          placeholder: 'Current location',
                          suffix: Icon(Icons.location_pin),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(255, 56, 51, 51)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: CupertinoTextField(
                          controller: endingpoint,
                          placeholder: 'Destination',
                          suffix: Icon(Icons.location_pin),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(255, 56, 51, 51)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          final item = widget.busList![index];
                          String busname = item.busname;
                          String busNumber = item.regnum;
                          // String busRoute =
                          //     "${item.startBusstop} - ${item.endBusstop}";
                          String startingTime = "${item.startBustime}";
                          String destinationTime = item.endBustime;

                          return Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: Card(
                                child: Container(
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    onTap: () async {
                                      await navigateToTracking(context, item);
                                    },
                                    title: Text(busname),
                                    trailing: Text(busNumber),
                                    // subtitle: Text(busRoute),
                                    leading: Icon(Icons.directions_bus),
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(item.startBusstop),
                                          Text(item.endBusstop),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(startingTime),
                                          Text(destinationTime),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton.icon(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          LiveBus(
                                                              busName: busname,
                                                              stratingTime: item
                                                                  .startBustime,
                                                              busNumber:
                                                                  busNumber)));
                                            },
                                            icon: Icon(Icons
                                                .location_searching_outlined),
                                            label: Text("Live Location"),
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (ctx) => AlertDialog(
                                                    title:
                                                        const Text("Notify Me"),
                                                    content:
                                                        DropdownButton<int>(
                                                      // Change to DropdownButton<int?>
                                                      hint:
                                                          Text('Select a Stop'),
                                                      value: _selectedStopId,
                                                      onChanged:
                                                          (int? newValue) {
                                                        // Change parameter type to int?
                                                        print(newValue);
                                                        setState(() {
                                                          _selectedStopId =
                                                              newValue;
                                                        });
                                                      },
                                                      items: stopsList.map<
                                                              DropdownMenuItem<
                                                                  int>>(
                                                          (Map<String, dynamic>
                                                              stop) {
                                                        return DropdownMenuItem<
                                                            int>(
                                                          value: stop['stopid'],
                                                          child: Text(
                                                              stop['stopname']),
                                                        );
                                                      }).toList(),
                                                    ),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () async {
                                                          final res =
                                                              await addNotification(
                                                                  item.busid
                                                                      .toString(),
                                                                  item.regnum,
                                                                  _selectedStopId
                                                                      .toString(),
                                                                  item.busname);
                                                                  print("noti result : ${res}");
                                                          if (res == true) {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          }
                                                        },
                                                        child: Container(
                                                          color: Colors.green,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(14),
                                                          child: const Text(
                                                              "okay"),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                              child: Text("Notify"))
                                        ],
                                      ))
                                ],
                              ),
                            )),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 3);
                        },
                        itemCount: widget.busList!.length))
              ],
            ),
    );
  }

  navigateToTracking(BuildContext context, BusByStops item) async {
    bustracking.clear();
    bustracking = await getBusLocation(item.busid.toString(), item.regnum);
    print(bustracking.length);
    print(bustracking[bustracking.length - 1].order);
    print(bustracking[bustracking.length - 1].busstop);
    busstops = await getStopsByRoute(item.routeid.toString());
    await getStops();
    print(stops);

    await getBusStopwithRouteid(item.routeid.toString());
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => BusRoute(
          busid: item.busid.toString(),
          busName: item.busname,
          busNumber: item.regnum,
          stratingTime: item.startBustime,
          destinationTime: item.endBusstop),
    ));
  }

  getStops() async {
    stops.clear();
    print("bus t : $bustracking");
    for (var i = 0; i < busstops.length; i++) {
      final stop = busstops[i];
      stops.add(stop.busstop);
    }
  }
}

final stopsList = [
  {"stopid": 1, "stopname": "Kozhikode"},
  {"stopid": 2, "stopname": "Kannur"},
  {"stopid": 6, "stopname": "Koyilandy"},
  {"stopid": 7, "stopname": "Vatakara"}
];
