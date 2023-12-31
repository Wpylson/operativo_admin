import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _categoriesStream =
        FirebaseFirestore.instance.collection('categories').snapshots();
    return StreamBuilder<QuerySnapshot>(
        stream: _categoriesStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Ocorreu algum erro');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.indigo[900]),
            );
          }
          return GridView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.size,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6, mainAxisSpacing: 8, crossAxisSpacing: 8),
              itemBuilder: (context, index) {
                final categoryData = snapshot.data!.docs[index];
                return Column(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.network(
                        categoryData['image'],
                      ),
                    ),
                    Text(
                      categoryData['categoryName'],
                      style: const TextStyle(fontSize: 12.0),
                    ),
                  ],
                );
              });
        });
  }
}
