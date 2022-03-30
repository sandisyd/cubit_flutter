import 'package:cubit_flutter/cubit/cubit/insert_cubit.dart';
import 'package:cubit_flutter/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataPage extends StatelessWidget {
  DataPage({Key? key}) : super(key: key);

  TextEditingController fullname = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController nohp = TextEditingController();

  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InsertCubit(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: 400,
            child: Form(
                key: _keyForm,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: ListView(
                  children: [
                    const Text(
                      'Fullname',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: TextFormField(
                        validator: (val) {
                          return val!.isEmpty ? 'Tidak boleh kosong' : null;
                        },
                        controller: fullname,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintText: 'Masukkan nama lengkap Anda'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Username',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: TextFormField(
                        controller: username,
                        validator: (val) {
                          return val!.isEmpty ? 'Tidak boleh kosong' : null;
                          // print(val);
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintText: 'Masukkan username Anda'),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Email',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: TextFormField(
                        validator: (val) {
                          return val!.isEmpty ? 'Tidak boleh kosong' : null;
                        },
                        controller: email,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintText: 'Masukkan email Anda'),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Password',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: TextFormField(
                        controller: password,
                        validator: (val) {
                          return val!.isEmpty ? 'Tidak boleh kosong' : null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintText: 'Masukkan password Anda'),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Phone Number',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: TextFormField(
                        controller: nohp,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintText: 'Masukkan nomor telepon Anda'),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                )),
          ),
        ),
        bottomNavigationBar: BlocBuilder<InsertCubit, InsertState>(
          builder: (context, state) {
            InsertCubit cubit = context.read<InsertCubit>();
            if (state is InsertLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 15),
              child: MaterialButton(
                color: Colors.amber,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () async {
                  if (_keyForm.currentState!.validate()) {
                    await cubit.insertUser(fullname.text, username.text,
                        email.text, password.text, nohp.text, context);
                  }
                },
                child: const Text('Sign Up',
                    style: TextStyle(color: Colors.white)),
              ),
            );
          },
        ),
      ),
    );
  }
}
