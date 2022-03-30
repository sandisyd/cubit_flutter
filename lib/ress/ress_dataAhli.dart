// To parse this JSON data, do
//
//     final ressDataAhli = ressDataAhliFromJson(jsonString);

import 'dart:convert';

RessDataAhli ressDataAhliFromJson(String str) =>
    RessDataAhli.fromJson(json.decode(str));

String ressDataAhliToJson(RessDataAhli data) => json.encode(data.toJson());

class RessDataAhli {
  RessDataAhli({
    this.status,
    this.message,
    this.newtoken,
    this.data,
  });

  bool? status;
  String? message;
  String? newtoken;
  List<TenagaAhli>? data;

  factory RessDataAhli.fromJson(Map<String, dynamic> json) => RessDataAhli(
        status: json["status"],
        message: json["message"],
        newtoken: json["newtoken"],
        data: List<TenagaAhli>.from(
            json["data"].map((x) => TenagaAhli.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "newtoken": newtoken,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class TenagaAhli {
  TenagaAhli({
    this.idTenagaAhli,
    this.nama,
    this.tempatLahir,
    this.pendidikan,
    this.jabatan,
    this.idUser,
    this.pengalamanKerja,
    this.profesi,
    this.npwp,
    this.ktp,
    this.createdBy,
    this.bidangId,
    this.fakultasId,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  int? idTenagaAhli;
  String? nama;
  String? tempatLahir;
  String? pendidikan;
  String? jabatan;
  String? idUser;
  PengalamanKerja? pengalamanKerja;
  Profesi? profesi;
  String? npwp;
  String? ktp;
  String? createdBy;
  String? bidangId;
  String? fakultasId;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<User>? user;

  factory TenagaAhli.fromJson(Map<String, dynamic> json) => TenagaAhli(
        idTenagaAhli: json["id_tenaga_ahli"],
        nama: json["nama"],
        tempatLahir: json["tempat_lahir"],
        pendidikan: json["pendidikan"] == null ? null : json["pendidikan"],
        jabatan: json["jabatan"],
        idUser: json["id_user"],
        pengalamanKerja: pengalamanKerjaValues.map[json["pengalaman_kerja"]],
        profesi: profesiValues.map[json["profesi"]],
        npwp: json["npwp"],
        ktp: json["ktp"],
        createdBy: json["created_by"],
        bidangId: json["bidang_id"],
        fakultasId: json["fakultas_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: List<User>.from(json["user"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id_tenaga_ahli": idTenagaAhli,
        "nama": nama,
        "tempat_lahir": tempatLahir,
        "pendidikan": pendidikan == null ? null : pendidikan,
        "jabatan": jabatan,
        "id_user": idUser,
        "pengalaman_kerja": pengalamanKerjaValues.reverse[pengalamanKerja],
        "profesi": profesiValues.reverse[profesi],
        "npwp": npwp,
        "ktp": ktp,
        "created_by": createdBy,
        "bidang_id": bidangId,
        "fakultas_id": fakultasId,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "user": List<dynamic>.from(user!.map((x) => x.toJson())),
      };
}

enum PengalamanKerja { THE_15_TAHUN, THE_2630_TAHUN, THE_25_TH }

final pengalamanKerjaValues = EnumValues({
  "1 - 5 tahun": PengalamanKerja.THE_15_TAHUN,
  "2 - 5 th": PengalamanKerja.THE_25_TH,
  "26 - 30 tahun": PengalamanKerja.THE_2630_TAHUN
});

enum Profesi { PT_LAPI_ITB, DOSEN_ITB, HMM }

final profesiValues = EnumValues({
  "Dosen ITB": Profesi.DOSEN_ITB,
  "hmm": Profesi.HMM,
  "PT LAPI-ITB": Profesi.PT_LAPI_ITB
});

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
  Email? email;
  Level? level;
  String? foto;
  String? isVerified;
  DateTime? emailVerifiedAt;
  Phone? phone;
  DateTime? createdAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        namaLengkap: json["nama_lengkap"],
        username: json["username"] == null ? null : json["username"],
        email: emailValues.map[json["email"]],
        level: levelValues.map[json["level"]],
        foto: json["foto"],
        isVerified: json["is_verified"],
        emailVerifiedAt: json["email_verified_at"] == null
            ? null
            : DateTime.parse(json["email_verified_at"]),
        phone: phoneValues.map[json["phone"]],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_lengkap": namaLengkap,
        "username": username == null ? null : username,
        "email": emailValues.reverse[email],
        "level": levelValues.reverse[level],
        "foto": foto,
        "is_verified": isVerified,
        "email_verified_at":
            emailVerifiedAt == null ? null : emailVerifiedAt!.toIso8601String(),
        "phone": phoneValues.reverse[phone],
        "created_at": createdAt!.toIso8601String(),
      };
}

enum Email { EMPTY, NANDO_UDACODING_COM }

final emailValues = EnumValues(
    {"": Email.EMPTY, "nando@udacoding.com": Email.NANDO_UDACODING_COM});

enum Level { USER, ADMIN, OPERASI }

final levelValues = EnumValues(
    {"admin": Level.ADMIN, "operasi": Level.OPERASI, "user": Level.USER});

enum Phone { EMPTY, THE_082390607564, THE_085289587710 }

final phoneValues = EnumValues({
  "": Phone.EMPTY,
  "082390607564": Phone.THE_082390607564,
  "085289587710": Phone.THE_085289587710
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
