import '../../core/helpers/service_type_helper.dart';
import '../../view/home/add_horses/add_horse_data.dart';

class DetailTypeModel{
  final String title;
  final List<String> types;
  final bool load;
  DetailTypeModel({required this.title, required this.types,this.load = false});
}

DetailTypeModel? detailHelper({required type}){
  if(ServiceTypeHelper.coggings==type){
    return null;
  } else if(ServiceTypeHelper.injury==type){
    return DetailTypeModel(title: "Select Injuries",types: AddHorseData.injuries);
  } else if(ServiceTypeHelper.notes==type){
    return DetailTypeModel(title: "",types: []);
  } else if(ServiceTypeHelper.dental==type){
    return null;
  } else if(ServiceTypeHelper.deworming==type){
    return DetailTypeModel(title: "Select Deworming Records",types: AddHorseData.deworming);
  } else if(ServiceTypeHelper.therapy==type){
    return DetailTypeModel(title: "Select Therapy Record",types: AddHorseData.therapyTypes);
  } else if(ServiceTypeHelper.vaccination==type){
    return DetailTypeModel(title: "Select Vaccination Record",types:  AddHorseData.vaccinationsType);
  } else if(ServiceTypeHelper.vitals==type){
    return DetailTypeModel(title: "Select Vital Records",types: AddHorseData.vitals);
  } else if(ServiceTypeHelper.diagnostics==type){
    return DetailTypeModel(title: "Select Diagnostic Records",types: AddHorseData.diagnostic);
  } else if(ServiceTypeHelper.ferrier==type){
    return null;
  } else if(ServiceTypeHelper.generalHealth==type){
    return null;
  } else if(ServiceTypeHelper.jointInjection==type){
    return DetailTypeModel(title: "Select Joint Record",types: AddHorseData.jointsType);
  } else if(ServiceTypeHelper.medSupp==type){
    return null;
  } else {
    return null;
  }
}