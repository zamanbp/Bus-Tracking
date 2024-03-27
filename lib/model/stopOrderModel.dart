// To parse this JSON data, do
//
//     final StopOrderRouteModel = StopOrderRouteModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

StopOrderRouteModel StopOrderRouteModelFromJson(String str) => StopOrderRouteModel.fromJson(json.decode(str));

String StopOrderRouteModelToJson(StopOrderRouteModel data) => json.encode(data.toJson());

class StopOrderRouteModel {
    String busstop;
    String latitude;
    String longitude;
    int order;
    String rfid;
    int routeid;
    int stopid;

    StopOrderRouteModel({
        required this.busstop,
        required this.latitude,
        required this.longitude,
        required this.order,
        required this.rfid,
        required this.routeid,
        required this.stopid,
    });

    factory StopOrderRouteModel.fromJson(Map<String, dynamic> json) => StopOrderRouteModel(
        busstop: json["busstop"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        order: json["order"],
        rfid: json["rfid"],
        routeid: json["routeid"],
        stopid: json["stopid"],
    );

    Map<String, dynamic> toJson() => {
        "busstop": busstop,
        "latitude": latitude,
        "longitude": longitude,
        "order": order,
        "rfid": rfid,
        "routeid": routeid,
        "stopid": stopid,
    };
}
