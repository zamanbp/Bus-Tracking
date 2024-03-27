import 'package:http/http.dart' as http;
import 'package:major_project/constants/urls.dart';


getBusbyName(String busname) async{
  final uri = Uri.parse("$baseUrl/getbusbyname?busname=$busname");
  final responce = await http.get(uri);
  print(responce.statusCode);
  print(responce.body);
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