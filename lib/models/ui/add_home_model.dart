import 'package:flutter/material.dart';
import 'package:hourse_lux/core/constant/assets.dart';
import 'package:hourse_lux/view/HomeScreen/add_horses/new_horse_page.dart';

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
  SubAddHomeModel({
    required this.name,
    required this.image,
    required this.page
  });
}

List<AddHomeModel> allAddData = [
  AddHomeModel(
      title: "Horses",
      menus: [
        SubAddHomeModel(page: CreateNewHorse(),image: Images.horse_head, name: 'Horse'),
        SubAddHomeModel(page: Container(),image: Images.heart, name: 'Health'),
        SubAddHomeModel(page: Container(),image: Images.easy_installation, name: 'Service'),
        SubAddHomeModel(page: Container(),image: Images.renewable, name: 'Renewal'),
        SubAddHomeModel(page: Container(),image: Images.edit, name: 'Notes'),
        SubAddHomeModel(page: Container(),image: Images.thermometer, name: 'Temperature'),
        SubAddHomeModel(page: Container(),image: Images.Beehive, name: 'Breeding'),
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