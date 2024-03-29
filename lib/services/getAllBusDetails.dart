import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:major_project/constants/urls.dart';
import 'package:major_project/model/getAllBusModel.dart';


Future<List<GetAllBusModel>?> getAllBus() async{
  final uri = Uri.parse("$baseUrl/getallbus");
  final responce = await http.get(uri);
  print(responce.statusCode);
  print(responce.body);

  try {
    if (responce.statusCode == 200) {
      final res = jsonDecode(responce.body);
      final datas = (res as List).map((e) => GetAllBusModel.fromJson(e)).toList();
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