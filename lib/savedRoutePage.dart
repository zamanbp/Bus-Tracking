import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:major_project/getBusesbyrouteId.dart';
import 'package:major_project/model/savedBusModel.dart';
import 'package:major_project/viewBus.dart';

class SavedBusRoutePage extends StatelessWidget {
  final List<SavedBusModel>? routes;
  const SavedBusRoutePage({Key? key, this.routes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Routes"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final route = routes![index];
          return InkWell(
            onTap: () async{
              final buses = await getBusByRouteId(route.routeid.toString());
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewBus(busdetails: buses!, start: route.starting, end: route.starting),));
            },
            child: Card(
              child: IntrinsicWidth(
                child: ListTile(
                  leading: Icon(Icons.bus_alert),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Starting: ${route.starting}"),
                      SizedBox(height: 5),
                      Text("Ending: ${route.ending}"),
                    ],
                  ),
                  trailing: IconButton(
                    onPressed: () async{
                      //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewBus(busdetails: busdetails, start: route.starting, end: route.ending),))
                    },
                    icon: Icon(Icons.arrow_forward_ios, color: Colors.black38),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: routes!.length,
      ),
    );
  }
}
