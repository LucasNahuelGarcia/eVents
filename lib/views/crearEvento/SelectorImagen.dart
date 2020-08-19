import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class SelectorImagen extends StatefulWidget {
  SelectorImagen(Key key) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return SelectorImagenState();
  }
}

class SelectorImagenState extends State<SelectorImagen> {
  final _picker = ImagePicker();
  File _image;
  String imagePath = "";

  void save() {
    if (_image != null)
      imagePath = _image.path;
    else
      imagePath = "";
  }

  Future getImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => getImage(),
      child: _image == null
          ? SvgPicture.asset(
              "res/imageHolder.svg",
              fit: BoxFit.fitWidth,
              height: 200,
            )
          : Image.file(_image),
    );
  }
}
