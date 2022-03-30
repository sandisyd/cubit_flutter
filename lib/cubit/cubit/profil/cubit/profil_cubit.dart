import 'package:bloc/bloc.dart';
import 'package:cubit_flutter/cubit/cubit/fakultas/cubit/fakultas_cubit.dart';
import 'package:cubit_flutter/repo/repo_insert.dart';
import 'package:cubit_flutter/ress/ress_profil.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'profil_state.dart';

class ProfilCubit extends Cubit<ProfilState> {
  ProfilCubit() : super(ProfilInitial());

  RepoAuth repoAuth = RepoAuth();
  RessProfil? ressProfil;

  Future<void> getProfil(context) async {
    try {
      emit(ProfilLoading());
      RessProfil? res = await repoAuth.getProfil();
      if (res?.status == true) {
        ressProfil = res;
        emit(ProfilSukses(ressProfil!));
      } else if (res?.status == false) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${res?.message}'),
          backgroundColor: Colors.amber,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${res?.message}'),
          backgroundColor: Colors.amber,
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${e.toString()}'),
        backgroundColor: Colors.amber,
      ));
      emit(ProfilFailed(e.toString()));
    }
  }
}
