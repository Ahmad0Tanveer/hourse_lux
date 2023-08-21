class ServiceTypeHelper{
  static String coggings = "coggings";
  static String injury = "injury";
  static String dental = "dental";
  static String therapy = "therapy";
  static String vaccination = "vaccination";
  static String jointInjection = "jointInjection";
  static String diagnostics = "diagnostics";
  static String deworming = "deworming";
  static String ferrier = "ferrier";
  static String vitals = "vitals";
  static String notes = "notes";
  static String temperature = "temperature";
  static String generalHealth = "generalHealth";
  static String medSupp = "medSupp";
}

String imageHelper({required type}){
  if(ServiceTypeHelper.coggings==type){
    return "assets/icons/thermometer.png";
  } else if(ServiceTypeHelper.injury==type){
    return "assets/record_type/broken-bone.png";
  } else if(ServiceTypeHelper.notes==type){
    return "assets/icons/edit.png";
  } else if(ServiceTypeHelper.dental==type){
    return "assets/record_type/tooth2.png";
  } else if(ServiceTypeHelper.deworming==type){
    return "assets/record_type/deworm1.png";
  } else if(ServiceTypeHelper.therapy==type){
    return "assets/record_type/reiki1.png";
  } else if(ServiceTypeHelper.vaccination==type){
    return "assets/record_type/syringe.png";
  } else if(ServiceTypeHelper.vitals==type){
    return "assets/record_type/heart-beat1.png";
  } else if(ServiceTypeHelper.diagnostics==type){
    return "assets/record_type/stethoscope.png";
  } else if(ServiceTypeHelper.ferrier==type){
    return "assets/record_type/horseshoe1.png";
  } else if(ServiceTypeHelper.generalHealth==type){
    return "assets/record_type/health-care.png";
  } else if(ServiceTypeHelper.jointInjection==type){
    return "assets/record_type/boon_injection.png";
  } else if(ServiceTypeHelper.medSupp==type){
    return "assets/record_type/supplements.png";
  }
  return "assets/record_type/supplements.png";
}