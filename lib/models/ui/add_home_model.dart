import 'package:flutter/material.dart';
import 'package:hourse_lux/core/constant/assets.dart';
import 'package:hourse_lux/view/HomeScreen/add_horses/add_diagnostic_page.dart';
import 'package:hourse_lux/view/HomeScreen/add_horses/add_injury_page.dart';
import 'package:hourse_lux/view/HomeScreen/add_horses/add_joint_injection_page.dart';
import 'package:hourse_lux/view/HomeScreen/add_horses/add_therapy_page.dart';
import 'package:hourse_lux/view/HomeScreen/add_horses/add_vaccination_page.dart';
import 'package:hourse_lux/view/HomeScreen/add_horses/add_vitals_page.dart';
import 'package:hourse_lux/view/HomeScreen/add_horses/herse_select_page.dart';
import 'package:hourse_lux/view/HomeScreen/add_horses/new_horse_page.dart';
import 'package:hourse_lux/view/HomeScreen/add_horses/record_type_page.dart';

import '../../view/HomeScreen/add_horses/add_coggins_page.dart';
import '../../view/HomeScreen/add_horses/add_dental_page.dart';
import '../../view/HomeScreen/add_horses/add_deworming_page.dart';
import '../../view/HomeScreen/add_horses/add_note_page.dart';
import '../../view/HomeScreen/add_horses/add_temperature_page.dart';
import '../../view/HomeScreen/breadings/select_breading_page.dart';
import '../../view/HomeScreen/renewal_pages/renewal_type_page.dart';
import '../../view/HomeScreen/service_records/service_record_type.dart';

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
        SubAddHomeModel(page: AddNotePage(),image: Images.edit, name: 'Notes'),
        SubAddHomeModel(page: AddTemperaturePage(),image: Images.thermometer, name: 'Temperature'),
        SubAddHomeModel(page: SelectBreadingTypePage(),image: Images.Beehive, name: 'Breeding'),
      ]),
  AddHomeModel(
      title: "Contacts",
      menus: [
        SubAddHomeModel(page: Container(),image: Images.Contacts,name: "Contact"),
        SubAddHomeModel(page: Container(),image: Images.Upload,name: "Upload"),
        SubAddHomeModel(page: Container(),image: Images.UserGroups,name: "Owner Group"),
      ]),
  AddHomeModel(
      title: "Schedule",
      menus: [
        SubAddHomeModel(page: Container(),image: Images.Clock,name: "Service"),
        SubAddHomeModel(page: Container(),image: Images.edit,name: "Appointment"),
        SubAddHomeModel(page: Container(),image: Images.ToDo,name: "Task"),
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
  SubAddHomeModel(name: "Farrier",image: RecordType.horseshoe1,page: Container(),bottomSheet: false),
  SubAddHomeModel(name: "General Health",image: RecordType.health_care,page: Container(),bottomSheet: false),
  SubAddHomeModel(name: "Injury",image: RecordType.broken_bone,page: AddInjuryPage(),bottomSheet: false),
  SubAddHomeModel(name: "Joint Injection",image: RecordType.boon_injection,page: AddJointInjectionPage(),bottomSheet: false),
  SubAddHomeModel(name: "Med/supplements",image: RecordType.supplements,page: Container(),bottomSheet: false),
];