import 'package:cubit_flutter/cubit/cubit/insert_cubit.dart';
import 'package:cubit_flutter/cubit/cubit/login_cubit.dart';
import 'package:cubit_flutter/tambah/tambah.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => LoginCubit())],
        child: SafeArea(
          child: Material(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 38, top: 20, right: 38),
                child: Form(
                  key: _keyForm,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Masuk',
                        style: TextStyle(fontSize: 25),
                      ),
                      Row(
                        children: [
                          const Text(
                            'Belum punya akun ?',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DataPage()));
                              },
                              child: const Text('Register'))
                        ],
                      ),
                      const Text(
                        "Email",
                        style: TextStyle(fontSize: 17),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: email,
                        validator: (val) {
                          return val!.isEmpty ? 'Tidak boleh kosong' : null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintText: 'Masukkan email Anda'),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Password",
                        style: TextStyle(fontSize: 17),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: password,
                        validator: (val) {
                          return val!.isEmpty ? 'Tidak boleh kosong' : null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintText: 'Masukkan password Anda'),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: BlocBuilder<LoginCubit, LoginState>(
                          builder: (context, state) {
                            LoginCubit cubit = LoginCubit();
                            if (state is LoginLoding) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return MaterialButton(
                              minWidth: MediaQuery.of(context).size.width,
                              height: 50,
                              color: Colors.amber,
                              child: const Text(
                                'Masuk',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                              onPressed: () async {
                                if (_keyForm.currentState!.validate()) {
                                  await cubit.loginUser(
                                      email.text, password.text, context);
                                }
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
