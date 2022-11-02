import 'dart:convert';

FeedbackModel feedbackModelFromJson(String str) =>
    FeedbackModel.fromJson(json.decode(str));
String feedbackModelToJson(FeedbackModel data) => json.encode(data.toJson());

class FeedbackModel {
  FeedbackModel({
    required this.id,
    required this.msg,
  });
  String id;
  String msg;
  factory FeedbackModel.fromJson(Map<String, dynamic> json) => FeedbackModel(
        id: json["id"],
        msg: json["msg"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "msg": msg,
      };
}
