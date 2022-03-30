// To parse this JSON data, do
//
//     final ressBanner = ressBannerFromJson(jsonString);

import 'dart:convert';

RessBanner ressBannerFromJson(String str) =>
    RessBanner.fromJson(json.decode(str));

String ressBannerToJson(RessBanner data) => json.encode(data.toJson());

class RessBanner {
  RessBanner({
    this.status,
    this.message,
    this.newtoken,
    this.data,
  });

  bool? status;
  String? message;
  String? newtoken;
  List<Datum>? data;

  factory RessBanner.fromJson(Map<String, dynamic> json) => RessBanner(
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
    this.nama,
    this.photo,
    this.enable,
    this.fakultasId,
  });

  int? id;
  String? nama;
  String? photo;
  String? enable;
  String? fakultasId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        nama: json["nama"],
        photo: json["photo"],
        enable: json["enable"],
        fakultasId: json["fakultas_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "photo": photo,
        "enable": enable,
        "fakultas_id": fakultasId,
      };
}
