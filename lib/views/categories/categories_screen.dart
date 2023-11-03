import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  static const String routeName = '/categories_screen';
  const CategoriesScreen({super.key});
  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  dynamic _image;
  String? fileName;

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

  uploadCategory() {
    if (_formKey.currentState!.validate()) {
      print("Good Guy");
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
          ],
        ),
      ),
    );
  }
}
