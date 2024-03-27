
import 'package:meta/meta.dart';
import 'dart:convert';

SavedBusModel SavedBusModelFromJson(String str) => SavedBusModel.fromJson(json.decode(str));

String SavedBusModelToJson(SavedBusModel data) => json.encode(data.toJson());

class SavedBusModel {
    String ending;
    int logid;
    int routeid;
    String starting;
    int svid;

    SavedBusModel({
        required this.ending,
        required this.logid,
        required this.routeid,
        required this.starting,
        required this.svid,
    });

    factory SavedBusModel.fromJson(Map<String, dynamic> json) => SavedBusModel(
        ending: json["ending"],
        logid: json["logid"],
        routeid: json["routeid"],
        starting: json["starting"],
        svid: json["svid"],
    );

    Map<String, dynamic> toJson() => {
        "ending": ending,
        "logid": logid,
        "routeid": routeid,
        "starting": starting,
        "svid": svid,
    };
}
