import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:operativo_admin/views/banners/widgets/banner_widgets.dart';

class UploadBannerScreen extends StatefulWidget {
  static const String routeName = '/upload_banner_screen';
  const UploadBannerScreen({super.key});

  @override
  State<UploadBannerScreen> createState() => _UploadBannerScreenState();
}

class _UploadBannerScreenState extends State<UploadBannerScreen> {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  dynamic _image;
  String? fileName;

  pickImage() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.image);

    if (result != null) {
      setState(() {
        _image = result.files.first.bytes;
        fileName = result.files.first.name;
      });
    }
  }

  _uploadBannerToStorage(dynamic image) async {
    Reference ref = _storage.ref().child('Banners').child(fileName!);
    UploadTask uploadTask = ref.putData(image);
    Navigator.pop(context);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  uploadToFireStore() async {
    EasyLoading.show();
    if (_image != null) {
      String imageUrl = await _uploadBannerToStorage(_image);
      await _firestore.collection('banners').doc(fileName).set({
        'image': imageUrl,
      }).whenComplete(() {
        if (context.mounted) Navigator.pop(context);
        EasyLoading.dismiss();
        setState(() {
          _image = null;
        });
      });
    }
  }

  void displayMessage(String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Mensagem'),
              content: Text(message),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Ok"),
                ),
              ],
            ));
  }

  //Display a dialog message
  void displayCircularIndicator() {
    showDialog(
        context: context,
        builder: (context) => const CircularProgressIndicator.adaptive());
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
              'Banners ',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 26),
            ),
          ),
          Divider(
            color: Colors.grey.shade400,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: _image != null
                          ? Image.memory(
                              _image,
                              fit: BoxFit.cover,
                            )
                          : const Center(
                              child: Text('Banner'),
                            ),
                    ),
                    const SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: () {
                        pickImage();
                      },
                      child: const Text(
                        'Carregar imagem',
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  uploadToFireStore();
                },
                child: const Text(
                  'Salvar',
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              color: Colors.grey,
              height: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.topLeft,
              child: const Text(
                'Banners',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const BannerWidgets(),
        ],
      ),
    );
  }
}
