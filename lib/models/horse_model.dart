class HorseModel {
  String userId;
  String neckName;
  String showName;
  String owner;
  String billPayer;
  String bread;
  String color;
  String sex;
  String image;
  String microchip;
  String stallNotes;
  String paddockLocation;
  String sId;
  String createdAt;
  String updatedAt;
  String billPayerId;
  String ownerId;
  HorseModel({
    required this.userId,
    required this.neckName,
    required this.showName,
    required this.owner,
    required this.billPayer,
    required this.bread,
    required this.color,
    required this.sex,
    required this.image,
    required this.microchip,
    required this.stallNotes,
    required this.paddockLocation,
    required this.sId,
    required this.createdAt,
    required this.updatedAt,
    required this.billPayerId,
    required this.ownerId,
  });

  factory HorseModel.fromJson(Map<String, dynamic> json) {
    return HorseModel(
      userId : json['userId'],
      neckName : json['neckName'],
      showName : json['showName'],
      owner : json['owner'],
      billPayer: json['billPayer'],
      bread: json['bread'],
      color: json['color'],
      image: json["img"]??"",
      sex: json['sex'],
      microchip: json['microchip'],
      stallNotes: json['stallNotes'],
      paddockLocation: json['paddockLocation'],
      sId: json['_id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      billPayerId: json['billPayerId'],
      ownerId: json['ownerId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['neckName'] = this.neckName;
    data['showName'] = this.showName;
    data['owner'] = this.owner;
    data['billPayer'] = this.billPayer;
    data['bread'] = this.bread;
    data["img"] = this.image;
    data['color'] = this.color;
    data['sex'] = this.sex;
    data['microchip'] = this.microchip;
    data['stallNotes'] = this.stallNotes;
    data['paddockLocation'] = this.paddockLocation;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data["billPayerId"] = this.billPayerId;
    data["ownerId"] = this.ownerId;
    return data;
  }
}