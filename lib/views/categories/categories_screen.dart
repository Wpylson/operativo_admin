import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:operativo_admin/views/categories/widgets/category_widgets.dart';

class CategoriesScreen extends StatefulWidget {
  static const String routeName = '/categories_screen';
  const CategoriesScreen({super.key});
  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  dynamic _image;
  String? fileName;
  late String categoryName;

  _pickImage() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.image);

    if (result != null) {
      setState(() {
        _image = result.files.first.bytes;
        fileName = result.files.first.name;
      });
    }
  }

  _uploadCategoryBannerToStorage(dynamic image) async {
    Reference ref = _storage.ref().child('catgeoryImages').child(fileName!);

    UploadTask uploadTask = ref.putData(image);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  uploadCategory() async {
    EasyLoading.show();
    if (_formKey.currentState!.validate()) {
      String imageUrl = await _uploadCategoryBannerToStorage(_image);

      await _firestore.collection('categories').doc(fileName).set(
          {'image': imageUrl, 'categoryName': categoryName}).whenComplete(() {
        EasyLoading.dismiss();
        setState(() {
          _image = null;
          _formKey.currentState!.reset();
        });
      });
    } else {
      print("Bad guy");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Categorias ',
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
                                child: Text('Categorias'),
                              ),
                      ),
                      const SizedBox(height: 5),
                      ElevatedButton(
                        onPressed: () {
                          _pickImage();
                        },
                        child: const Text(
                          'Carregar imagem',
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    width: 300,
                    child: TextFormField(
                        onChanged: (value) {
                          categoryName = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor, o nome da categoria não pode estar vazio';
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: "Categoria",
                          hintText: "Digite o nome da categoria",
                        )),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    uploadCategory();
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  'Categorias',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const CategoryWidget(),
          ],
        ),
      ),
    );
  }
}
