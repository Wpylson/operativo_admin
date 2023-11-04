import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  static const String routeName = '/orders_screen';
  const OrdersScreen({super.key});

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
              'Orders Screen',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
            ),
          ),
          Row(
            children: [
              _rowWidget('Código', 1),
              _rowWidget('Nome', 1),
              _rowWidget('Enderecço', 2),
              _rowWidget('Estado', 1),
              _rowWidget('Acção', 1),
              _rowWidget('Ver mais..', 1),
            ],
          ),
        ],
      ),
    );
  }
}
