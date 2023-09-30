import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  static const String routeName = '/products_screen';
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(10),
        child: const Text(
          'Products Screen',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
        ),
      ),
    );
  }
}
