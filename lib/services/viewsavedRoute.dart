import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:major_project/constants/urls.dart';
import 'package:major_project/model/savedBusModel.dart';


Future<List<SavedBusModel>?> viewsavedRouteApi(String lid) async{
  var client = http.Client();
  try {
    final responce = await client.get(Uri.parse("$baseUrl/getsavedroute?logid=$lid"));
    print("status : ${responce.body}");
    if (responce.statusCode == 200 ) {
      final res = jsonDecode(responce.body);
      final routes = (res as List).map((e) => SavedBusModel.fromJson(e)).toList();
      return routes;
      
    }
    else{
      print(responce.statusCode);
      return null;

    }
  } catch (e) {
    print("catch : ${e.toString()}");
    return null;
  }
  
}