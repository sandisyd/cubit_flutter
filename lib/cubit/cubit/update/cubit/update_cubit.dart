import 'package:bloc/bloc.dart';
import 'package:cubit_flutter/home/homePage.dart';
import 'package:cubit_flutter/home/page_home.dart';
import 'package:cubit_flutter/home/user.dart';
import 'package:cubit_flutter/repo/repo_insert.dart';
import 'package:cubit_flutter/ress/ress_update.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'update_state.dart';

class UpdateCubit extends Cubit<UpdateState> {
  UpdateCubit() : super(UpdateInitial());

  RepoAuth repoAuth = RepoAuth();
  RessUpdate? ressUpdate;

  Future<void> updateUser(String? _fullname, String? _username, String? _email,
      String? _telp, context) async {
    try {
      RessUpdate? res =
          await repoAuth.updateUser(_fullname, _username, _email, _telp);
      if (res!.status == true) {
        ressUpdate = res;
        emit(UpdateSukses(ressUpdate!));
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => HomePage(
                      iniTab: 3,
                    )));
      } else if (res.status == false) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${res.message}'),
          backgroundColor: Colors.amber,
        ));
        emit(UpdateError('${res.message}'));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${res.message}'),
          backgroundColor: Colors.amber,
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${e.toString()}'),
        backgroundColor: Colors.amber,
      ));
      emit(UpdateFailed(e.toString()));
    }
  }
}
