import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImagenEvento extends StatelessWidget {
  final String referenciaImagen;
  ImagenEvento(this.referenciaImagen);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      child: referenciaImagen != null && referenciaImagen != ""
          ? CachedNetworkImage(
              imageUrl: referenciaImagen,
              placeholder: (context, url) => Container(
                child: LinearProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
            )
          : Image(
              image: AssetImage("res/imageHolder.png"),
              fit: BoxFit.fitHeight,
            ),
    );
  }
}
