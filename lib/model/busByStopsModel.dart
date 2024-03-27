// To parse this JSON data, do
//
//     final BusByStops = BusByStopsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BusByStops BusByStopsFromJson(String str) => BusByStops.fromJson(json.decode(str));

String BusByStopsToJson(BusByStops data) => json.encode(data.toJson());

class BusByStops {
    int busid;
    String busname;
    String endBusstop;
    String endBustime;
    String regnum;
    int routeid;
    String startBusstop;
    String startBustime;

    BusByStops({
        required this.busid,
        required this.busname,
        required this.endBusstop,
        required this.endBustime,
        required this.regnum,
        required this.routeid,
        required this.startBusstop,
        required this.startBustime,
    });

    factory BusByStops.fromJson(Map<String, dynamic> json) => BusByStops(
        busid: json["busid"],
        busname: json["busname"],
        endBusstop: json["end_busstop"],
        endBustime: json["end_bustime"],
        regnum: json["regnum"],
        routeid: json["routeid"],
        startBusstop: json["start_busstop"],
        startBustime: json["start_bustime"],
    );

    Map<String, dynamic> toJson() => {
        "busid": busid,
        "busname": busname,
        "end_busstop": endBusstop,
        "end_bustime": endBustime,
        "regnum": regnum,
        "routeid": routeid,
        "start_busstop": startBusstop,
        "start_bustime": startBustime,
    };
}
