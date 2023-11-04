import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  static const String routeName = '/products_screen';
  const ProductsScreen({super.key});

  Widget _rowWidget(String text, int flex) {
    return Expanded(
        flex: flex,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade500),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Products Screen',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 26),
            ),
          ),
          Row(
            children: [
              _rowWidget('Foto', 1),
              _rowWidget('Nome', 2),
              _rowWidget('Quantidade', 1),
              _rowWidget('Preço', 1),
              _rowWidget('Acção', 1),
              _rowWidget('Ver mais', 1),
            ],
          ),
        ],
      ),
    );
  }
}
