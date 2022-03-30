import 'package:cubit_flutter/home/homePage.dart';
import 'package:cubit_flutter/home/page_home.dart';
import 'package:cubit_flutter/local/data_global.dart';
import 'package:cubit_flutter/local/prefs.dart';
import 'package:cubit_flutter/login/login.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Future<void> cekSession() async {
    Future.delayed(const Duration(seconds: 5), () async {
      dataGlobal.user = await Prefs.loadUser();
      if (dataGlobal.user != null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (_) => HomePage(
                      iniTab: 0,
                    )),
            (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => LoginPage()), (route) => false);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cekSession();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          width: double.maxFinite,
          height: size.height,
          color: const Color(0xff0791F8),
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  left: 0,
                  child: Image.asset(
                    'img/splash/ellipse.png',
                    width: size.width * 0.4,
                  )),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(
                    'img/splash/ganesha.png',
                    width: size.width * 0.5,
                  )),
              Center(
                child: Image.asset(
                  'img/splash/Logo.png',
                  width: size.width * 0.6,
                ),
              ),

              // IntroPage(),
            ],
          )),
    );
  }
}
