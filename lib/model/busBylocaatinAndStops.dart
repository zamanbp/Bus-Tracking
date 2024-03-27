// To parse this JSON data, do
//
//     final BusStopsAndLocation = BusStopsAndLocationFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BusStopsAndLocation BusStopsAndLocationFromJson(String str) => BusStopsAndLocation.fromJson(json.decode(str));
String BusStopsAndLocationToJson(BusStopsAndLocation data) => json.encode(data.toJson());

class BusStopsAndLocation {
    String busregno;
    String busstop;
    String bustime;
    DateTime date;
    int id;
    String latitude;
    String longitude;
    int order;
    int stopid;
    String time;

    BusStopsAndLocation({
        required this.busregno,
        required this.busstop,
        required this.bustime,
        required this.date,
        required this.id,
        required this.latitude,
        required this.longitude,
        required this.order,
        required this.stopid,
        required this.time,
    });

    factory BusStopsAndLocation.fromJson(Map<String, dynamic> json) => BusStopsAndLocation(
        busregno: json["busregno"],
        busstop: json["busstop"],
        bustime: json["bustime"],
        date: DateTime.parse(json["date"]),
        id: json["id"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        order: json["order"],
        stopid: json["stopid"],
        time: json["time"],
    );

    Map<String, dynamic> toJson() => {
        "busregno": busregno,
        "busstop": busstop,
        "bustime": bustime,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "id": id,
        "latitude": latitude,
        "longitude": longitude,
        "order": order,
        "stopid": stopid,
        "time": time,
    };
}
