import 'package:cubit_flutter/cubit/cubit/update/cubit/update_cubit.dart';
import 'package:cubit_flutter/ress/ress_profil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdatePage extends StatefulWidget {
  Data? data;
  UpdatePage(this.data);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextEditingController? _fullname, _username, _email, _telp;

  @override
  void initState() {
    _fullname = TextEditingController(text: widget.data!.namaLengkap);
    _username = TextEditingController(text: widget.data!.username);
    _email = TextEditingController(text: widget.data!.email);
    _telp = TextEditingController(text: widget.data!.phone);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => UpdateCubit())],
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.black),
            title: const Text(
              'Edit Profil',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.only(left: 38, top: 11, right: 38),
              child: Form(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        // clipBehavior: Clip.none,
                        children: [
                          CircleAvatar(
                            minRadius: 37,
                            backgroundColor: Colors.grey,
                            backgroundImage:
                                AssetImage('img/indonesia_food.jpg'),
                            // foregroundImage: ,
                          ),
                          Positioned(
                            right: 100,
                            bottom: 0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.amber,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Full Name'),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _fullname,
                        decoration: InputDecoration(
                            hintText: 'Masukan nama lengkap Anda',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Username'),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _username,
                        decoration: InputDecoration(
                            hintText: 'Masukan username Anda',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Email'),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _email,
                        decoration: InputDecoration(
                            hintText: 'Masukan email Anda',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('No Telephone'),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _telp,
                        decoration: InputDecoration(
                            hintText: 'Masukan nomor telepon Anda',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(left: 38, right: 38, bottom: 15),
            child: BlocBuilder<UpdateCubit, UpdateState>(
              builder: (context, state) {
                UpdateCubit cubit = context.read<UpdateCubit>();
                if (state is UpdateLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    // minWidth: MediaQuery.of(context).size.width / 2,
                    height: 38,
                    color: Colors.amber,
                    child: Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      await cubit.updateUser(_fullname!.text, _username!.text,
                          _email!.text, _telp!.text, context);
                    });
              },
            ),
          ),
        ));
  }
}
