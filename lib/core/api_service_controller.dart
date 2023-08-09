import 'package:hourse_lux/core/helpers/enums_herlper.dart';
import 'package:hourse_lux/main.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://hurseluxprojectupdate-production.up.railway.app";
  Future request({required endPoint,Map body = const {},RequestType type = RequestType.get}) async {
    if(type == RequestType.get){
      return await http.get(Uri.parse("${baseUrl}/$endPoint"), headers: {
        "userId": box.read("userId"),
      });
    } else if(type == RequestType.post){
      return await http.post(Uri.parse("${baseUrl}/$endPoint"), body: body);
    } else if(type == RequestType.put){

    } else if(type == RequestType.delete){

    } else if(type == RequestType.patch){

    } else {

    }
  }
}