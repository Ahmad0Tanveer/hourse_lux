class OwnerGroup{
  final String id;
  final String name;
  final String number;
  final String comment;
  final String horseId;
  final String userId;
  final String shares;
  OwnerGroup({
    required this.id,
    required this.name,
    required this.number,
    required this.comment,
    required this.horseId,
    required this.userId,
    required this.shares
  });
  factory OwnerGroup.fromJson(Map<String, dynamic> json) {
    return OwnerGroup(
      id: json['_id'].toString(),
      name: json['name'].toString(),
      number: json['number'].toString(),
      comment: json['comment'].toString(),
      horseId: json['horseId'].toString(),
      userId: json['userId'].toString(),
      shares: json['shares'],
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'name': name,
    'number': number,
    'comment': comment,
    'horseId': horseId,
    'userId': userId,
    'shares': shares,
  };
}