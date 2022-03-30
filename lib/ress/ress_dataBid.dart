// To parse this JSON data, do
//
//     final ressDataBid = ressDataBidFromJson(jsonString);

import 'dart:convert';

RessDataBid ressDataBidFromJson(String str) =>
    RessDataBid.fromJson(json.decode(str));

String ressDataBidToJson(RessDataBid data) => json.encode(data.toJson());

class RessDataBid {
  RessDataBid({
    this.status,
    this.message,
    this.newtoken,
    this.data,
  });

  bool? status;
  String? message;
  String? newtoken;
  List<DataBidang>? data;

  factory RessDataBid.fromJson(Map<String, dynamic> json) => RessDataBid(
        status: json["status"],
        message: json["message"],
        newtoken: json["newtoken"],
        data: List<DataBidang>.from(
            json["data"].map((x) => DataBidang.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "newtoken": newtoken,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DataBidang {
  DataBidang({
    this.id,
    this.bidang,
    this.fakultasId,
    this.photo,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? bidang;
  String? fakultasId;
  String? photo;
  DateTime? createdAt;
  String? updatedAt;

  factory DataBidang.fromJson(Map<String, dynamic> json) => DataBidang(
        id: json["id"],
        bidang: json["bidang"],
        fakultasId: json["fakultas_id"],
        photo: json["photo"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bidang": bidang,
        "fakultas_id": fakultasId,
        "photo": photo,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt,
      };
}
