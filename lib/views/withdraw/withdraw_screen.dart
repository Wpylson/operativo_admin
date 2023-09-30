import 'package:flutter/material.dart';

class WithDrawScreen extends StatelessWidget {
  static const String routeName = '/whitdrawl_screen';
  const WithDrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(10),
        child: const Text(
          'WithDraw Screen',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
        ),
      ),
    );
  }
}
