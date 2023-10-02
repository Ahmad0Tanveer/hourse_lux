import 'package:hourse_lux/core/helpers/enums_herlper.dart';
import 'package:hourse_lux/core/helpers/keys.dart';
import 'package:hourse_lux/main.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://hurseluxprojectupdate-production.up.railway.app";
  Future request({required endPoint,Map body = const {},RequestType type = RequestType.get}) async {
    Map userMap = box.read(allKeys.userMap)??{};
    Map<String,String> headers = {
      "Authorization": "Bearer ${userMap["token"]??{}}",
      "Access-Control-Allow-Origin": "*",
      'Accept': '*/*'
    };
    if(type == RequestType.get){
      return await http.get(Uri.parse("${baseUrl}/$endPoint"), headers: headers);
    } else if(type == RequestType.post){
      return await http.post(Uri.parse("${baseUrl}/$endPoint"), body: body,headers: headers);
    } else if(type == RequestType.put){
      return await http.put(Uri.parse("${baseUrl}/$endPoint"), body: body,headers: headers);
    } else if(type == RequestType.delete){
      return await http.delete(Uri.parse("${baseUrl}/$endPoint"),headers: headers);
    } else if(type == RequestType.patch){} else {}
  }
}