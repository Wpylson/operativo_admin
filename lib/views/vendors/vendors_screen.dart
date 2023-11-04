import 'package:flutter/material.dart';

class VendorsScreen extends StatelessWidget {
  static const String routeName = '/vendors_screen';
  const VendorsScreen({super.key});

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
              'Vendedores',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
            ),
          ),
          Row(children: [
            _rowWidget('Logo', 1),
            _rowWidget('Nome', 2),
            _rowWidget('Endereço', 2),
            _rowWidget('Telefone', 1),
            _rowWidget('Acções', 1),
            _rowWidget('Mais detalhes', 1)
          ]),
        ],
      ),
    );
  }
}
