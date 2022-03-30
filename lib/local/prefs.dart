import 'dart:convert';

import 'package:cubit_flutter/local/data_global.dart';
import 'package:cubit_flutter/ress/ress_login.dart';
// import 'package:cubit_flutter/ress/ress_dataAhli.dart';
// import '';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static Future<void> saveUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("user_saved", jsonEncode(dataGlobal.user?.toJson()));
  }

  static Future<User?> loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      return User.fromJson(jsonDecode(prefs.getString("user_saved") ?? ""));
    } catch (e) {
      return null;
    }
  }

  static Future<void> clearSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
