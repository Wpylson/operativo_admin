import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  static const String routeName = '/dashboard_screen';
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(10),
        child: const Text(
          'Dashboard Home',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
        ),
      ),
    );
  }
}
