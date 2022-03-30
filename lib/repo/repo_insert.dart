import 'dart:convert';
import 'dart:developer';

import 'package:cubit_flutter/api/api.dart';
import 'package:cubit_flutter/local/data_global.dart';
import 'package:cubit_flutter/ress/ress_banner.dart';
import 'package:cubit_flutter/ress/ress_dataAhli.dart';
import 'package:cubit_flutter/ress/ress_dataBid.dart';
import 'package:cubit_flutter/ress/ress_data_fakultas.dart';
import 'package:cubit_flutter/ress/ress_login.dart';
import 'package:cubit_flutter/ress/ress_profil.dart';
import 'package:cubit_flutter/ress/ress_regist.dart';
import 'package:cubit_flutter/ress/ress_update.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class RepoAuth {
  bool isLoading = false;
  Future<RessInsert?> insertUser(String? fullname, String? username,
      String? email, String? password, String? nohp) async {
    try {
      Response res = await http.post(Uri.parse(apiInsert), body: {
        'full_name': fullname,
        'username': username,
        'email': email,
        'password': password,
        'phone': nohp
      });
      return RessInsert.fromJson(jsonDecode(res.body));
    } catch (e) {
      log(e.toString());
    }
  }

  Future<RessLogin?> loginUser(String email, String password) async {
    try {
      Response res = await http.post(Uri.parse(apiLogin),
          body: {'email': email, 'password': password});
      return RessLogin.fromJson(jsonDecode(res.body));
    } catch (e) {
      log(e.toString());
    }
  }

  Future<RessBanner?> getBanner() async {
    try {
      Response res = await http.get(Uri.parse(apiBanner));
      return RessBanner.fromJson(jsonDecode(res.body));
    } catch (e) {
      log(e.toString());
    }
  }

  Future<RessFakultas?> getFakultas() async {
    try {
      Response res = await http.get(Uri.parse(apiFakultas));
      return RessFakultas.fromJson(jsonDecode(res.body));
    } catch (e) {
      log(e.toString());
    }
  }

  Future<RessDataAhli?> getTenagaAhli() async {
    try {
      Response res = await http.get(Uri.parse(apiTenagaAhli));
      return RessDataAhli.fromJson(jsonDecode(res.body));
    } catch (e) {
      log(e.toString());
    }
  }

  Future<RessDataBid?> getBidang() async {
    try {
      Response res = await http.get(Uri.parse(apiBidangFakultas));
      return RessDataBid.fromJson(jsonDecode(res.body));
    } catch (e) {
      log(e.toString());
    }
  }

  Future<RessProfil?> getProfil() async {
    try {
      Response res = await http.get(Uri.parse(apiProfil + '821'));
      return RessProfil.fromJson(jsonDecode(res.body));
    } catch (e) {
      log(e.toString());
    }
  }

  Future<RessUpdate?> updateUser(String? _fullname, String? _username,
      String? _email, String? _telp) async {
    try {
      Response res = await http.post(Uri.parse(apiUpdate), body: {
        'id': dataGlobal.user!.id.toString(),
        'full_name': _fullname,
        'username': _username,
        'email': _email,
        'phone': _telp
      });
      return RessUpdate.fromJson(jsonDecode(res.body));
    } catch (e) {
      log(e.toString());
    }
  }
}
