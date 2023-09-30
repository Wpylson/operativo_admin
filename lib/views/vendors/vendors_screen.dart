import 'package:flutter/material.dart';

class VendorsScreen extends StatelessWidget {
  static const String routeName = '/vendors_screen';
  const VendorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(10),
        child: const Text(
          'Manager Vendors',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
        ),
      ),
    );
  }
}
