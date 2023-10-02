import 'package:flutter/material.dart';
import 'package:hourse_lux/core/constant/assets.dart';
import 'package:hourse_lux/view/home/add_horses/add_diagnostic_page.dart';
import 'package:hourse_lux/view/home/add_horses/add_injury_page.dart';
import 'package:hourse_lux/view/home/add_horses/add_joint_injection_page.dart';
import 'package:hourse_lux/view/home/add_horses/add_therapy_page.dart';
import 'package:hourse_lux/view/home/add_horses/add_vaccination_page.dart';
import 'package:hourse_lux/view/home/add_horses/add_vitals_page.dart';
import 'package:hourse_lux/view/home/add_horses/herse_select_page.dart';
import 'package:hourse_lux/view/home/add_horses/new_horse_page.dart';
import 'package:hourse_lux/view/home/add_horses/record_type_page.dart';

import '../../core/helpers/service_type_helper.dart';
import '../../view/home/add_horses/add_coggins_page.dart';
import '../../view/home/add_horses/add_dental_page.dart';
import '../../view/home/add_horses/add_deworming_page.dart';
import '../../view/home/add_horses/add_farrier_page.dart';
import '../../view/home/add_horses/add_general_health_page.dart';
import '../../view/home/add_horses/add_med_supplymentary_page.dart';
import '../../view/home/add_horses/add_note_page.dart';
import '../../view/home/add_horses/add_temperature_page.dart';
import '../../view/home/breadings/select_breading_page.dart';
import '../../view/home/contacts/add_contact_page.dart';
import '../../view/home/contacts/add_contact_upload.dart';
import '../../view/home/contacts/new_owner_group.dart';
import '../../view/home/new _nvent/new_even_appointment_page.dart';
import '../../view/home/new _nvent/new_event_service_page.dart';
import '../../view/home/new _nvent/new_event_task_page.dart';
import '../../view/home/renewal_pages/renewal_type_page.dart';
import '../../view/home/service_records/service_record_type.dart';

class AddHomeModel{
  final String title;
  final List<SubAddHomeModel> menus;
  AddHomeModel({
    required this.title,
    required this.menus,
  });
}

class SubAddHomeModel{
  final String name;
  final String image;
  final Widget page;
  bool bottomSheet;
  SubAddHomeModel({
    required this.name,
    required this.image,
    required this.page,
    this.bottomSheet = false,
  });
}

List<AddHomeModel> allAddData = [
  AddHomeModel(
      title: "Horses",
      menus: [
        SubAddHomeModel(page: CreateNewHorse(),image: Images.horse_head, name: 'Horse'),
        SubAddHomeModel(page: RecordTypePage(),image: Images.heart, name: 'Health',bottomSheet: true),
        SubAddHomeModel(page: HorseSelectPage(nextPage: ServiceRecordTypePage(), title: "Add Service Record", ),image: Images.easy_installation, name: 'Service'),
        SubAddHomeModel(page: RenewalTypesPage(),image: Images.renewable, name: 'Renewal'),
        SubAddHomeModel(page: HorseSelectPage(nextPage:  AddNotePage(),title: "Add Note"),image: Images.edit, name: 'Notes'),
        SubAddHomeModel(page: HorseSelectPage(nextPage: AddTemperaturePage(),title: "Add Temperature",),image: Images.thermometer, name: 'Temperature'),
        SubAddHomeModel(page: SelectBreadingTypePage(),image: Images.Beehive, name: 'Breeding'),
      ]),
  AddHomeModel(
      title: "Contacts",
      menus: [
        SubAddHomeModel(page: AddContactPage(),image: Images.Contacts,name: "Contact"),
        SubAddHomeModel(page: AddContactUpload(),image: Images.Upload,name: "Upload"),
        SubAddHomeModel(page: NewOwnerGroup(),image: Images.UserGroups,name: "Owner Group"),
      ]),
  AddHomeModel(
      title: "Schedule",
      menus: [
        SubAddHomeModel(page: NewEventServicePage(),image: Images.Clock,name: "Service"),
        SubAddHomeModel(page: NewEventAppointmentPage(),image: Images.edit,name: "Appointment"),
        SubAddHomeModel(page: NewEventTaskPage(),image: Images.ToDo,name: "Task"),
      ]),
  AddHomeModel(
      title: "Financial",
      menus: [
        SubAddHomeModel(page: Container(),image: Images.ReceiveDollar,name: "Payment Received"),
      ]
  ),
];

List<SubAddHomeModel> healthTabs = [
  SubAddHomeModel(name: "Coggins",image: RecordType.test_tube2,page: AddCogginsPage(),bottomSheet: false),
  SubAddHomeModel(name: "Dental",image: RecordType.tooth2,page: AddDentalPage(),bottomSheet: false),
  SubAddHomeModel(name: "Deworming",image: RecordType.deworm1,page: AddDewormingPage(),bottomSheet: false),
  SubAddHomeModel(name: "Therapy",image: RecordType.reiki1,page: AddTherapyPage(),bottomSheet: false),
  SubAddHomeModel(name: "Vaccination",image: RecordType.syringe,page: AddVaccinationPage(),bottomSheet: false),
  SubAddHomeModel(name: "Vitals",image: RecordType.heart_beat1,page: AddVitalsPage(),bottomSheet: false),
  SubAddHomeModel(name: "Diagnostic",image: RecordType.stethoscope,page: AddDiagnosticPage(),bottomSheet: false),
  SubAddHomeModel(name: "Farrier",image: RecordType.horseshoe1,page: AddFarrierPage(),bottomSheet: false),
  //SubAddHomeModel(name: "General Health",image: RecordType.health_care,page: AddGeneralHealthPage(),bottomSheet: false),
  SubAddHomeModel(name: "Injury",image: RecordType.broken_bone,page: AddInjuryPage(),bottomSheet: false),
  SubAddHomeModel(name: "Joint Injection",image: RecordType.boon_injection,page: AddJointInjectionPage(),bottomSheet: false),
  SubAddHomeModel(name: "Med/supplements",image: RecordType.supplements,page: AddMedSupplyMentary(),bottomSheet: false),
];
class RecordFiltersType{
  final String name;
  final String image;
  final String filterKey;
  bool haseSubType;
  bool isMap;
  String subType;
  bool hasWordRecord;
  RecordFiltersType({
    required this.name,
    required this.image,
    required this.filterKey,
    this.hasWordRecord = true,
    this.haseSubType = false,
    this.isMap = false,
    this.subType = "",
  });
}
List<RecordFiltersType> reportRecordType = [
  RecordFiltersType(name: "Coggins",image: RecordType.test_tube2, filterKey: ServiceTypeHelper.coggings),
  RecordFiltersType(name: "Dental",image: RecordType.tooth2,filterKey: ServiceTypeHelper.dental),
  RecordFiltersType(name: "Deworming",image: RecordType.deworm1,filterKey: ServiceTypeHelper.deworming),
  RecordFiltersType(name: "Therapy",image: RecordType.reiki1,filterKey: ServiceTypeHelper.therapy),
  RecordFiltersType(name: "Vaccination",image: RecordType.syringe,filterKey: ServiceTypeHelper.vaccination),
  RecordFiltersType(name: "Vitals",image: RecordType.heart_beat1,filterKey: ServiceTypeHelper.vitals),
  RecordFiltersType(name: "Diagnostic",image: RecordType.stethoscope,filterKey: ServiceTypeHelper.diagnostics),
  RecordFiltersType(name: "Farrier",image: RecordType.horseshoe1,filterKey: ServiceTypeHelper.ferrier),
  RecordFiltersType(name: "General Health",image: RecordType.health_care,filterKey: ServiceTypeHelper.generalHealth),
  RecordFiltersType(name: "Injury",image: RecordType.broken_bone,filterKey: ServiceTypeHelper.injury),
  RecordFiltersType(name: "Joint Injection",image: RecordType.boon_injection,filterKey: ServiceTypeHelper.jointInjection),
  RecordFiltersType(name: "Med/supplements",image: RecordType.supplements,filterKey: ServiceTypeHelper.medSupp),
  RecordFiltersType(name: "Milk Test",image: RecordType.broken_bone,filterKey: ServiceTypeHelper.breading,isMap: true, subType: "Milk Test", haseSubType: true,hasWordRecord: false),
  RecordFiltersType(name: "Notes",image: RecordType.boon_injection,filterKey: ServiceTypeHelper.notes,hasWordRecord: false),
  RecordFiltersType(name: "Passport Renewal",image: RecordType.supplements,filterKey: ServiceTypeHelper.breading,isMap: true, subType: "Passport", haseSubType: true,hasWordRecord: false),
  RecordFiltersType(name: "Foaling Record",image: RecordType.broken_bone,filterKey: ServiceTypeHelper.breading,isMap: true, subType: "Foaling", haseSubType: true,hasWordRecord: false),
  RecordFiltersType(name: "Medication...",image: RecordType.boon_injection,filterKey: ServiceTypeHelper.breading,isMap: true, subType: "Medication", haseSubType: true,hasWordRecord: false),
  RecordFiltersType(name: "Pregnancy Test...",image: RecordType.supplements,filterKey: ServiceTypeHelper.breading,isMap: true, subType: "Pregnancy Check", haseSubType: true,hasWordRecord: false),
  RecordFiltersType(name: "FEI Renewal...",image: RecordType.broken_bone,filterKey: ServiceTypeHelper.breading,isMap: true, subType: "Passport", haseSubType: true,hasWordRecord: false),
  RecordFiltersType(name: "Insemination...",image: RecordType.boon_injection,filterKey: ServiceTypeHelper.breading,isMap: true, subType: "Passport", haseSubType: true,hasWordRecord: false),
  RecordFiltersType(name: "Semen Collection...",image: RecordType.supplements,filterKey: ServiceTypeHelper.breading,isMap: true, subType: "Passport", haseSubType: true,hasWordRecord: false),
];