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
    required this.phoneNumber,
    required this.addressLineCity,
  });

  String userId;
  String addressId;
  String name;
  String addressLineOne;
  String phoneNumber;
  String addressLineCity;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        userId: json["userID"],
        addressId: json["addressID"],
        name: json["name"],
        addressLineOne: json["addressLineOne"],
        phoneNumber: json["phoneNumber"],
        addressLineCity: json["addressLineCity"],
      );

  Map<String, dynamic> toJson() => {
        "userID": userId,
        "addressID": addressId,
        "name": name,
        "addressLineOne": addressLineOne,
        "phoneNumber": phoneNumber,
        "addressLineCity": addressLineCity,
      };
}
