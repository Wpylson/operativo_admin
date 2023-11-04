import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BannerWidgets extends StatelessWidget {
  const BannerWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _bannersStream =
        FirebaseFirestore.instance.collection('banners').snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: _bannersStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Ocorreu algum erro...');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.indigo[900],
            ),
          );
        }
        return GridView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data!.size,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6, mainAxisSpacing: 8, crossAxisSpacing: 8),
          itemBuilder: (context, index) {
            final bannerData = snapshot.data!.docs[index];
            return Column(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.network(
                    bannerData['image'],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.zoom_in,
                        color: Colors.grey[400],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                )
              ],
            );
          },
        );
      },
    );
  }
}
