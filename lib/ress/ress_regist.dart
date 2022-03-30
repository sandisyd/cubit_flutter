// To parse this JSON data, do
//
//     final ressInsert = ressInsertFromJson(jsonString);

import 'dart:convert';

RessInsert ressInsertFromJson(String str) =>
    RessInsert.fromJson(json.decode(str));

String ressInsertToJson(RessInsert data) => json.encode(data.toJson());

class RessInsert {
  RessInsert({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Data? data;

  factory RessInsert.fromJson(Map<String, dynamic> json) => RessInsert(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.namaLengkap,
    this.username,
    this.level,
    this.email,
    this.phone,
    this.createdAt,
    this.id,
  });

  String? namaLengkap;
  String? username;
  String? level;
  String? email;
  String? phone;
  DateTime? createdAt;
  int? id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        namaLengkap: json["nama_lengkap"],
        username: json["username"],
        level: json["level"],
        email: json["email"],
        phone: json["phone"],
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "nama_lengkap": namaLengkap,
        "username": username,
        "level": level,
        "email": email,
        "phone": phone,
        "created_at": createdAt!.toIso8601String(),
        "id": id,
      };
}
