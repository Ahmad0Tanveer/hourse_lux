class ContactModel{
  final String id;
  final String contactType;
  final String title;
  final String firstName;
  final String lastName;
  final String primaryPhone;
  final String email;
  final String fullName;
  ContactModel({
    required this.id,
    required this.contactType,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.primaryPhone,
    required this.email,
    required this.fullName,
  });
  factory ContactModel.fromMap(dynamic map) {
    return ContactModel(
      id: map["_id"]??"",
      contactType: map['contact_type']??"",
      title: map['title']??"",
      firstName: map['first_name']??"",
      lastName: map['last_name']??"",
      primaryPhone: map['primary_phone']??"",
      email: map['email']??"",
      fullName:  map['first_name']??"" + " " + map['last_name']??""
    );
  }
}