import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:major_project/constants/urls.dart';
import 'package:major_project/model/busBylocaatinAndStops.dart';
import 'package:major_project/model/commonList.dart';

Future<List<BusStopsAndLocation>> getBusLocation(String busid,String reg) async{
  final uri = Uri.parse("$baseUrl/getbuscurrentlocationbybusid?busid=$busid&busreg=$reg");
  final responce = await http.get(uri);
  print(responce.statusCode);
  print("location : ${responce.body}");

  try {
    if (responce.statusCode == 200) {
      print("success");
      final res = jsonDecode(responce.body);
      final reply = (res as List).map((e) => BusStopsAndLocation.fromJson(e)).toList();
      print("rply $reply");
      return reply;
    }
    else{
      print("Else ");
      return bustracking;
    }
  } catch (e) {
    print(e.toString());
    return bustracking;
  }
}