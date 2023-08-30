import 'package:hourse_lux/main.dart';
import 'keys.dart';

class CacheHelper{
  static String userId(){
    Map userMap = box.read(allKeys.userMap)??{};
    final String id = userMap["User"]["_id"]??"";
    return id;
  }
}