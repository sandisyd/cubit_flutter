// To parse this JSON data, do
//
//     final ressLogin = ressLoginFromJson(jsonString);

import 'dart:convert';

RessLogin ressLoginFromJson(String str) => RessLogin.fromJson(json.decode(str));

String ressLoginToJson(RessLogin data) => json.encode(data.toJson());

class RessLogin {
  RessLogin({
    this.status,
    this.message,
    this.newtoken,
    this.isEmailVerified,
    this.user,
    this.token,
  });

  bool? status;
  String? message;
  String? newtoken;
  bool? isEmailVerified;
  User? user;
  String? token;

  factory RessLogin.fromJson(Map<String, dynamic> json) => RessLogin(
        status: json["status"],
        message: json["message"],
        newtoken: json["newtoken"],
        isEmailVerified: json["is_email_verified"],
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "newtoken": newtoken,
        "is_email_verified": isEmailVerified,
        "user": user!.toJson(),
        "token": token,
      };
}

class User {
  User({
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

  factory User.fromJson(Map<String, dynamic> json) => User(
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
