// ignore_for_file: unnecessary_string_interpolations

import 'package:bloc/bloc.dart';
import 'package:cubit_flutter/repo/repo_insert.dart';
import 'package:cubit_flutter/ress/ress_data_fakultas.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'fakultas_state.dart';

class FakultasCubit extends Cubit<FakultasState> {
  FakultasCubit() : super(FakultasInitial());

  RepoAuth repoAuth = RepoAuth();
  RessFakultas? ressFakultas;

  Future<void> getFakultas(context) async {
    try {
      emit(FakultasLoading());
      RessFakultas? res = await repoAuth.getFakultas();
      if (res?.status == true) {
        ressFakultas = res;
        emit(FakultasSukses(ressFakultas));
      } else if (res?.status == false) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${res?.message}'),
          backgroundColor: Colors.amber,
        ));
        emit(FakultasError('${res?.message}'));
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
      emit(FakultasFailed('${e.toString()}'));
    }
  }
}
