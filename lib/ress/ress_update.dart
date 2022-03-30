// To parse this JSON data, do
//
//     final ressUpdate = ressUpdateFromJson(jsonString);

import 'dart:convert';

RessUpdate ressUpdateFromJson(String str) =>
    RessUpdate.fromJson(json.decode(str));

String ressUpdateToJson(RessUpdate data) => json.encode(data.toJson());

class RessUpdate {
  RessUpdate({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Data? data;

  factory RessUpdate.fromJson(Map<String, dynamic> json) => RessUpdate(
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
    this.id,
    this.namaLengkap,
    this.username,
    this.email,
    this.level,
    this.foto,
    this.isVerified,
    this.emailVerifiedAt,
    this.phone,
    this.createdAt,
  });

  int? id;
  String? namaLengkap;
  String? username;
  String? email;
  String? level;
  String? foto;
  String? isVerified;
  DateTime? emailVerifiedAt;
  String? phone;
  DateTime? createdAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        namaLengkap: json["nama_lengkap"],
        username: json["username"],
        email: json["email"],
        level: json["level"],
        foto: json["foto"],
        isVerified: json["is_verified"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        phone: json["phone"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_lengkap": namaLengkap,
        "username": username,
        "email": email,
        "level": level,
        "foto": foto,
        "is_verified": isVerified,
        "email_verified_at": emailVerifiedAt!.toIso8601String(),
        "phone": phone,
        "created_at": createdAt!.toIso8601String(),
      };
}
