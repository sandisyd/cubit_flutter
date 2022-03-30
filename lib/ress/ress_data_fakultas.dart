// To parse this JSON data, do
//
//     final ressFakultas = ressFakultasFromJson(jsonString);

import 'dart:convert';

RessFakultas ressFakultasFromJson(String str) =>
    RessFakultas.fromJson(json.decode(str));

String ressFakultasToJson(RessFakultas data) => json.encode(data.toJson());

class RessFakultas {
  RessFakultas({
    this.status,
    this.message,
    this.newtoken,
    this.data,
  });

  bool? status;
  String? message;
  String? newtoken;
  List<DataFakultas>? data;

  factory RessFakultas.fromJson(Map<String, dynamic> json) => RessFakultas(
        status: json["status"],
        message: json["message"],
        newtoken: json["newtoken"],
        data: List<DataFakultas>.from(
            json["data"].map((x) => DataFakultas.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "newtoken": newtoken,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DataFakultas {
  DataFakultas({
    this.id,
    this.fakultasNama,
    this.fakultasDeskripsi,
    this.fakultasEnable,
    this.photo,
  });

  int? id;
  String? fakultasNama;
  String? fakultasDeskripsi;
  String? fakultasEnable;
  String? photo;

  factory DataFakultas.fromJson(Map<String, dynamic> json) => DataFakultas(
        id: json["id"],
        fakultasNama: json["fakultas_nama"],
        fakultasDeskripsi: json["fakultas_deskripsi"],
        fakultasEnable: json["fakultas_enable"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fakultas_nama": fakultasNama,
        "fakultas_deskripsi": fakultasDeskripsi,
        "fakultas_enable": fakultasEnable,
        "photo": photo,
      };
}
