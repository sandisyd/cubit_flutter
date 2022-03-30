import 'package:bloc/bloc.dart';
import 'package:cubit_flutter/repo/repo_insert.dart';
import 'package:cubit_flutter/ress/ress_banner.dart';
import 'package:flutter/material.dart';
// import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit() : super(BannerInitial());

  RepoAuth repoAuth = RepoAuth();
  RessBanner? ressBanner;

  Future<void> getBanner(context) async {
    try {
      emit(BannerLoading());
      RessBanner? res = await repoAuth.getBanner();
      if (res!.status == true) {
        ressBanner = res;
        emit(BannerSuccess(ressBanner!));
      } else if (res.status == false) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${res.message}'),
          backgroundColor: Colors.amber,
        ));
        emit(BannerError('${res.message}'));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${res.message}'),
          backgroundColor: Colors.amber,
        ));
        emit(BannerFailed('${res.message}'));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        backgroundColor: Colors.amber,
      ));
      emit(BannerFailed(e.toString()));
    }
  }
}
