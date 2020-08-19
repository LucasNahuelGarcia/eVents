import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectorUbicacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: SvgPicture.asset(
                'res/mapaUbicacion.svg',
                fit: BoxFit.cover,
                allowDrawingOutsideViewBox: false,
              ),
            ),
          ),
          Expanded(
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Avellaneda al 500, Madagascar."),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
