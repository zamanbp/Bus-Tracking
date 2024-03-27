

import 'package:http/http.dart' as http;
import 'package:major_project/constants/urls.dart';


getBusStopwithRouteid(String routeId) async{
  final uri = Uri.parse("$baseUrl/getallbus_busstop?routeid=$routeId");
  final responce = await http.get(uri);
  print(responce.statusCode);

  try {
    if (responce.statusCode == 200) {
      print("success");
    }
    else{
      print("Else ");
    }
  } catch (e) {
    print(e.toString());
  }
}