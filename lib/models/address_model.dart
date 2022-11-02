import 'dart:convert';

AddressModel addressModelFromJson(String str) =>
    AddressModel.fromJson(json.decode(str));

String addressModelToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel {
  AddressModel({
    required this.userId,
    required this.addressId,
    required this.name,
    required this.addressLineOne,
    required this.phone,
    required this.city,
    required this.postalCode,
  });

  String userId;
  String addressId;
  String name;
  String addressLineOne;
  String phone;
  String city;
  String postalCode;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        userId: json["userID"],
        addressId: json["addressID"],
        name: json["name"],
        addressLineOne: json["addressLineOne"],
        phone: json["phone"],
        city: json["city"],
        postalCode: json["postalCode"],
      );

  Map<String, dynamic> toJson() => {
        "userID": userId,
        "addressID": addressId,
        "name": name,
        "addressLineOne": addressLineOne,
        "phone": phone,
        "city": city,
        "postalCode": postalCode,
      };
}
