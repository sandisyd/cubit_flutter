import 'package:bloc/bloc.dart';
import 'package:cubit_flutter/repo/repo_insert.dart';
import 'package:cubit_flutter/ress/ress_dataBid.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'bidang_state.dart';

class BidangCubit extends Cubit<BidangState> {
  BidangCubit() : super(BidangInitial());

  RepoAuth repoAuth = RepoAuth();
  RessDataBid? ressDataBid;

  Future<void> getBidang(context) async {
    try {
      emit(BidangLoading());
      RessDataBid? res = await repoAuth.getBidang();
      if (res!.status == true) {
        ressDataBid = res;
        emit(BidangSukses(ressDataBid!));
      } else if (res.status == false) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${res.message}'),
          backgroundColor: Colors.amber,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${res.message}'),
          backgroundColor: Colors.amber,
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        backgroundColor: Colors.amber,
      ));
      emit(BidangFailed(e.toString()));
    }
  }
}
