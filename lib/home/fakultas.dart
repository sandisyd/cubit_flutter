import 'package:flutter/material.dart';

class FakultasPage extends StatelessWidget {
  const FakultasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.green,
    );
  }
}
