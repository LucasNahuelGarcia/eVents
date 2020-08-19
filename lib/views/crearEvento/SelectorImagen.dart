import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class SelectorImagen extends StatefulWidget {
  final SelectorImagenState _selectorImagenState = SelectorImagenState();
  String submitImagen() => _selectorImagenState.submitImagen();
  @override
  State<StatefulWidget> createState() {
    return SelectorImagenState();
  }
}

class SelectorImagenState extends State<SelectorImagen> {
  File _image;
  final picker = ImagePicker();

  String submitImagen() {
    String path = "";
    if (_image != null) path = _image.path;
    return path;
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

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
