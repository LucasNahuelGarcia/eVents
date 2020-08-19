import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImagenEvento extends StatelessWidget {
  final String referenciaImagen;
  ImagenEvento(this.referenciaImagen);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      color: Colors.black,
      padding: EdgeInsets.zero,
      child: referenciaImagen != null && referenciaImagen != ""
          ? CachedNetworkImage(
              imageUrl: referenciaImagen,
              placeholder: (context, url) => Container(
                child: LinearProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
            )
          : SvgPicture.asset(
              'res/imageHolder.svg',
              fit: BoxFit.fitWidth,
            ),
    );
  }
}
