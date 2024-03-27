import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:major_project/constants/urls.dart';
import 'package:major_project/model/getRoutemodel.dart';


Future<List<BusRoutes>?> getRouteName() async{
  final uri = Uri.parse("$baseUrl/getallroute");
  final responce = await http.get(uri);
  print(responce.statusCode);
  print(responce.body);

  try {
    if (responce.statusCode == 200) {
      final res = jsonDecode(responce.body);
      final routes = (res as List).map((e) => BusRoutes.fromJson(e)).toList();
      return routes;
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