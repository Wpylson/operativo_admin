import 'package:flutter/material.dart';

class UploadBannerScreen extends StatelessWidget {
  static const String routeName = '/upload_banner_screen';
  const UploadBannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(10),
        child: const Text(
          'Upload Banner Screen',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
        ),
      ),
    );
  }
}
