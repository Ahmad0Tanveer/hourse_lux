class ServiceTypeHelper{
  static String coggings = "coggings";
  static String injury = "injury";
  static String dental = "dental";
  static String therapy = "therapy";
}

String imageHelper({required type}){
  if(ServiceTypeHelper.coggings==type){
    return "";
  } else if(ServiceTypeHelper.injury==type){
    return "";
  }
  return "";
}