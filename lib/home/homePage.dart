import 'package:carousel_slider/carousel_slider.dart';
import 'package:cubit_flutter/cubit/bidang/cubit/bidang_cubit.dart';
import 'package:cubit_flutter/cubit/cubit/cubit/banner_cubit.dart';
import 'package:cubit_flutter/cubit/cubit/fakultas/cubit/fakultas_cubit.dart';
import 'package:cubit_flutter/home/fakultas.dart';
import 'package:cubit_flutter/home/file.dart';
import 'package:cubit_flutter/home/page_home.dart';
import 'package:cubit_flutter/home/user.dart';
import 'package:cubit_flutter/ress/ress_banner.dart';
import 'package:cubit_flutter/ress/ress_dataAhli.dart';
import 'package:cubit_flutter/ress/ress_dataBid.dart';
import 'package:cubit_flutter/ress/ress_data_fakultas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({this.iniTab, Key? key}) : super(key: key);
  final int? iniTab;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectNavbar = 0;

  void _selectedMenu(int index) {
    setState(() {
      _selectNavbar = index;
    });
  }

  List? page;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    page = [PageHome(), const FilePage(), const FakultasPage(), UserPage()];
    _selectNavbar = widget.iniTab ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page![_selectNavbar],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectedMenu,
          currentIndex: _selectNavbar,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('img/homePage/navbar/home.png')),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('img/homePage/navbar/file.png')),
                label: 'File Saya'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('img/homePage/navbar/fakultas.png')),
                label: 'Fakultas'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('img/homePage/navbar/user.png')),
                label: 'User'),
          ]),
    );
  }
}
