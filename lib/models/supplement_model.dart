class SupplementModel {
  final String id;
  final String bName;
  final String dName;
  final String userId;
  SupplementModel({required this.id, required this.bName, required this.dName, required this.userId});

  factory SupplementModel.fromJson(Map<String, dynamic> json) {
    return SupplementModel(
      id: json['_id'],
      bName: json['med_name'],
      dName: json['drug_name'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() => {
        'med_name': bName,
        'drug_name': dName,
  };
}
