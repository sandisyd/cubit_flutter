import 'dart:ui';

import 'package:cubit_flutter/cubit/cubit/profil/cubit/profil_cubit.dart';
import 'package:cubit_flutter/home/update.dart';
import 'package:cubit_flutter/local/prefs.dart';
import 'package:cubit_flutter/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatefulWidget {
  // UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List? user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = [
      {
        'gambar': 'img/homePage/profil/account.png',
        'nama': 'Profile',
        'onTap': () {}
      },
      {
        'gambar': 'img/homePage/profil/setting.png',
        'nama': 'Setting',
        'onTap': () {}
      },
      {
        'gambar': 'img/homePage/profil/logout.png',
        'nama': 'Logout',
        'onTap': () async {
          await Prefs.clearSession().then((value) =>
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => LoginPage()),
                  (route) => false));
        }
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
      child: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => ProfilCubit())],
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          // color: Colors.green,
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: BlocBuilder<ProfilCubit, ProfilState>(
              builder: (context, state) {
                ProfilCubit cubit = context.read<ProfilCubit>();
                if (state is ProfilInitial) {
                  cubit.getProfil(context);
                }
                if (state is ProfilLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Profil',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 20),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        UpdatePage(cubit.ressProfil!.data)));
                          },
                          child: const ImageIcon(AssetImage(
                              'img/homePage/profil/akar-icons_edit.png')),
                        )
                      ],
                    ),
                    CircleAvatar(
                      minRadius: 37,
                      backgroundColor: Colors.grey,
                      backgroundImage: AssetImage('img/indonesia_food.jpg'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('${cubit.ressProfil?.data?.namaLengkap}'),
                    Text('${cubit.ressProfil?.data?.level}'),
                    Expanded(
                      child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Image.asset(
                                '${user?[index]['gambar']}',
                                width: 20,
                                height: 22,
                                color: user?[index]['nama'] == 'Logout'
                                    ? Colors.red
                                    : Colors.grey,
                              ),
                              title: Text(
                                '${user?[index]['nama']}',
                                style: TextStyle(
                                    color: user?[index]['nama'] == 'Logout'
                                        ? Colors.red
                                        : Colors.grey),
                              ),
                              onTap: () {
                                user?[index]['onTap']();
                              },
                            );
                          }),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    ));
  }
}
