
class ServiceModel{
  String id;
  String horseId;
  String userId;
  String serviceType;
  String date;
  String nextDate;
  String recordType;
  String adminName;
  String adminId;
  String price;
  String image;
  String comment;
  String diagName;
  String diagId;
  String value;
  String extraData;
  String quantity;
  String cost;

  ServiceModel({
    required this.id,
    required this.userId,
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
        userId: json['uid']??"",
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
    "horseId": horseId,
    "uid": userId,
    "serviceType": serviceType,
    "date": date,
    "nextDate": nextDate,
    "recordType": recordType,
    "adminName": adminName,
    "adminId": adminId,
    "price": price,
    "image": image,
    "comment": comment,
    "diagName": diagName,
    "diagId": diagId,
    "value": value,
    "cost": cost,
    "quantity": quantity,
    "extraData": extraData,
    "_id": id,
  };
}