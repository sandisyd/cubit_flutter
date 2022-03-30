import 'package:bloc/bloc.dart';
import 'package:cubit_flutter/home/homePage.dart';
import 'package:cubit_flutter/home/page_home.dart';
import 'package:cubit_flutter/local/data_global.dart';
import 'package:cubit_flutter/local/prefs.dart';
import 'package:cubit_flutter/main.dart';
import 'package:cubit_flutter/repo/repo_insert.dart';
import 'package:cubit_flutter/ress/ress_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  RepoAuth repoAuth = RepoAuth();
  RessLogin? ressLogin;

  Future<void> loginUser(String email, String password, context) async {
    try {
      emit(LoginLoding());
      RessLogin? res = await repoAuth.loginUser(email, password);
      if (res?.status == true) {
        ressLogin = res;
        dataGlobal.user = ressLogin?.user;
        Prefs.saveUser();
        emit(LoginSuccess(ressLogin));
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => HomePage(
                      iniTab: 0,
                    )));
      } else if (res?.status == false) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('${res?.message}'), backgroundColor: Colors.amber));
        emit(LoginError('${res?.message}'));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${res?.message}'),
          backgroundColor: Colors.amber,
        ));
        emit(LoginError('${res?.message}'));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        backgroundColor: Colors.amber,
      ));
      emit(LoginError(e.toString()));
    }
  }
}
