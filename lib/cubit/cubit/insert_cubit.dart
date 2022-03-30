import 'package:bloc/bloc.dart';
import 'package:cubit_flutter/home/homePage.dart';
import 'package:cubit_flutter/home/page_home.dart';
import 'package:cubit_flutter/login/login.dart';
import 'package:cubit_flutter/main.dart';
import 'package:cubit_flutter/repo/repo_insert.dart';
import 'package:cubit_flutter/ress/ress_regist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'insert_state.dart';

class InsertCubit extends Cubit<InsertState> {
  InsertCubit() : super(InsertInitial());

  RepoAuth repoAuth = RepoAuth();
  RessInsert? ressInsert;

  Future<void> insertUser(String? fullname, String? username, String? email,
      String? password, String? nohp, context) async {
    try {
      RessInsert? ress =
          await repoAuth.insertUser(fullname, username, email, password, nohp);
      if (ress!.status == true) {
        ressInsert = ress;
        emit(InsertSuccess(ressInsert!));
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: SizedBox(
                  height: 358,
                  width: 300,
                  child: Column(
                    children: [
                      Expanded(
                          flex: 5,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 55),
                                child: Image.asset(
                                    'img/splash/undraw_mail_sent_re_0ofv 1.png',
                                    height: 90),
                              ),
                              const SizedBox(
                                height: 26,
                              ),
                              const Text(
                                "Link Verifikasi Terkirim",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                "Link verifikasi akun kamu sudah dikirim \nmelalui email, konfirmasi untuk masuk ke \naplikasi dan mulai menjelajah",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    height: 2),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )),
                      Expanded(
                        child: Container(
                          width: 300,
                          color: const Color(0xFFEDAB00),
                          child: TextButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => LoginPage()),
                                    (route) => false);
                              },
                              child: const Text(
                                "Lanjutkan",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
        // print(Submit());
        // Submit();
      } else if (ress.status == false) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${ress.message}'),
          backgroundColor: Colors.amber,
        ));
        emit(InsertError('${ress.message}'));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${ress.message}'),
          backgroundColor: Colors.amber,
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        backgroundColor: Colors.amber,
      ));
      emit(InsertError(e.toString()));
    }
  }
}

/*class Submit {
  void submit(BuildContext context) {
    Dialog alert = Dialog(
      child: SizedBox(
        height: 358,
        width: 300,
        child: Column(
          children: [
            Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 55),
                      child: Image.asset(
                          'img/splash/undraw_mail_sent_re_0ofv 1.png',
                          height: 90),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    const Text(
                      "Link Verifikasi Terkirim",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Link verifikasi akun kamu sudah dikirim \nmelalui email, konfirmasi untuk masuk ke \naplikasi dan mulai menjelajah",
                      style: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w400, height: 2),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
            Expanded(
              child: Container(
                width: 300,
                color: const Color(0xFFEDAB00),
                child: TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => LoginPage()),
                          (route) => false);
                    },
                    child: const Text(
                      "Lanjutkan",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    )),
              ),
            )
          ],
        ),
      ),
    );
    showDialog(
        context: context,
        builder: (context) => Dialog(
              child: SizedBox(
                height: 358,
                width: 300,
                child: Column(
                  children: [
                    Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 55),
                              child: Image.asset(
                                  'img/splash/undraw_mail_sent_re_0ofv 1.png',
                                  height: 90),
                            ),
                            const SizedBox(
                              height: 26,
                            ),
                            const Text(
                              "Link Verifikasi Terkirim",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              "Link verifikasi akun kamu sudah dikirim \nmelalui email, konfirmasi untuk masuk ke \naplikasi dan mulai menjelajah",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  height: 2),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),
                    Expanded(
                      child: Container(
                        width: 300,
                        color: const Color(0xFFEDAB00),
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => LoginPage()),
                                  (route) => false);
                            },
                            child: const Text(
                              "Lanjutkan",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ));*/

