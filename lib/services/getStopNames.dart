import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:major_project/constants/globalVar.dart';
import 'package:major_project/constants/urls.dart';

Future<List<String>> getStops() async{
  final uri = Uri.parse("$baseUrl/stops");
  final responce = await http.get(uri);
  print("Stops : ${responce.body}");
  
  try {
    if (responce.statusCode == 200) {
      final stops = jsonDecode(responce.body);
      for (var i = 0; i < stops.length; i++) {
        stopName.add(stops[i].toString());
      }
      print("success");
      return stopName;
    }
    else{
      print("Else ");
      return stopName;
    }
  } catch (e) {
    print(e.toString());
    return stopName;
  }
}