import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:major_project/constants/urls.dart';
import 'package:major_project/model/busByStopsModel.dart';
import 'package:major_project/model/busDetails.dart';


Future<List<BusDetailsModel>?> getBusByRouteId(String routeId) async{
  try {
  final uri = Uri.parse("$baseUrl/getallbusdetailsbyrouteid?routeid=$routeId");
  final responce = await http.get(uri);
  print(responce.statusCode);
  print("body:  ${responce.body}");
    if (responce.statusCode >= 200 || responce.statusCode < 300) {
       final res = jsonDecode(responce.body);
       final datas = (res as List).map((e) => BusDetailsModel.fromJson(e)).toList();
      print("success");
      return datas;
    }
    else{
      print("Else ");
      return null;
    }
  } catch (e) {
    print(e.toString());
    return null;
  }
}