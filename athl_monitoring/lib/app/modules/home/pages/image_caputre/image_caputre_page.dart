import 'dart:io';

import 'package:athl_monitoring/app/modules/home/widgets/uploader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'image_caputre_controller.dart';

class ImageCaputrePage extends StatefulWidget {
  final String title;
  const ImageCaputrePage({Key key, this.title = "ImageCaputre"})
      : super(key: key);

  @override
  _ImageCaputrePageState createState() => _ImageCaputrePageState();
}

class _ImageCaputrePageState
    extends ModularState<ImageCaputrePage, ImageCaputreController> {
  //use 'controller' variable to access controller
  PickedFile _imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.photo_camera),
              onPressed: () {
                _pickImage(ImageSource.camera);
              },
            ),
            IconButton(
              icon: Icon(Icons.photo),
              onPressed: () {
                _pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          if (_imageFile != null) ...[
            Image.file(File(_imageFile.path)),
            FlatButton(
              child: Icon(Icons.refresh),
              onPressed: _clearImg,
            ),
            Uploader(file: File(_imageFile.path)),
          ]
        ],
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final _picker = ImagePicker();
    PickedFile selected = await _picker.getImage(source: source);

    setState(() {
      _imageFile = selected;
    });
  }

  //Remove Image
  void _clearImg() {
    setState(() {
      _imageFile = null;
    });
  }
}
