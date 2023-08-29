import 'package:shortuid/shortuid.dart';

class ServiceModel{
  final String id;
  final String horseId;
  final String serviceType;
  final String date;
  final String nextDate;
  final String recordType;
  final String adminName;
  final String adminId;
  final String price;
  final String image;
  final String comment;
  final String diagName;
  final String diagId;
  final String value;
  final String extraData;
  final String quantity;
  final String cost;
  ServiceModel({
    required this.id,
    required  this.horseId,
    required this.serviceType,
    required  this.date,
    required this.nextDate,
    required this.recordType,
    required this.adminName,
    required this.adminId,
    required this.price,
    required this.image,
    required this.comment,
    required this.diagName,
    required this.diagId,
    required this.value,
    required this.extraData,
    required this.cost,
    required this.quantity,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      horseId: json['horseId'],
      serviceType: json['serviceType'],
      date: json['date'],
      nextDate: json['nextDate'],
      recordType: json['recordType'],
      adminName: json['adminName'],
      adminId: json['adminId'],
      price: json['price'],
      image: json['image'],
      comment: json['comment'],
      diagName: json['diagName'],
      diagId: json['diagId'],
      value: json['value'],
      extraData: json['extraData'],
      cost: json["cost"]??"",
      quantity: json["quantity"]??"",
      id: json["_id"]??""
    );
  }

  Map<String, dynamic> toJson() => {
    'horseId': horseId,
    'serviceType': serviceType,
    'date': date,
    'nextDate': nextDate,
    'recordType': recordType,
    'adminName': adminName,
    'adminId': adminId,
    'price': price,
    'image': image,
    'comment': comment,
    'diagName': diagName,
    'diagId': diagId,
    'value': value,
    "cost": cost,
    "quantity": quantity,
    'extraData': extraData,
    "_id": id,
  };
}