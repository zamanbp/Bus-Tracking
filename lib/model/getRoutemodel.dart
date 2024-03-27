
import 'package:meta/meta.dart';
import 'dart:convert';

BusRoutes BusRoutesFromJson(String str) => BusRoutes.fromJson(json.decode(str));

String BusRoutesToJson(BusRoutes data) => json.encode(data.toJson());

class BusRoutes {
    String destination;
    int routeid;
    String source;

    BusRoutes({
        required this.destination,
        required this.routeid,
        required this.source,
    });

    factory BusRoutes.fromJson(Map<String, dynamic> json) => BusRoutes(
        destination: json["destination"],
        routeid: json["routeid"],
        source: json["source"],
    );

    Map<String, dynamic> toJson() => {
        "destination": destination,
        "routeid": routeid,
        "source": source,
    };
}
