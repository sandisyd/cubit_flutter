// To parse this JSON data, do
//
//     final ressPendidikan = ressPendidikanFromJson(jsonString);

import 'dart:convert';

RessPendidikan ressPendidikanFromJson(String str) =>
    RessPendidikan.fromJson(json.decode(str));

String ressPendidikanToJson(RessPendidikan data) => json.encode(data.toJson());

class RessPendidikan {
  RessPendidikan({
    this.status,
    this.message,
    this.newtoken,
    this.data,
  });

  bool? status;
  String? message;
  String? newtoken;
  List<Datum>? data;

  factory RessPendidikan.fromJson(Map<String, dynamic> json) => RessPendidikan(
        status: json["status"],
        message: json["message"],
        newtoken: json["newtoken"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "newtoken": newtoken,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.pendidikan,
  });

  int? id;
  String? pendidikan;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        pendidikan: json["pendidikan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pendidikan": pendidikan,
      };
}
