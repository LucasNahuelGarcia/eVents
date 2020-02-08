import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

class FloatingNavBar extends StatefulWidget {
  final ValueNotifier<int> _paginaActual;
  FloatingNavBar(this._paginaActual);

  @override
  State<StatefulWidget> createState() {
    return FloatingNavBarState(this._paginaActual);
  }
}

class FloatingNavBarState extends State<FloatingNavBar> {
  final ValueNotifier<int> _paginaActual;
  FloatingNavBarState(this._paginaActual);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30,
        currentIndex: _paginaActual.value,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(GroovinMaterialIcons.apps),
            title: Text("Descubre"),
          ),
          BottomNavigationBarItem(
              icon: Icon(GroovinMaterialIcons.heart_box),
              title: Text("Guardados")),
          BottomNavigationBarItem(
              icon: Icon(GroovinMaterialIcons.ticket),
              title: Text("Compromisos")),
        ],
        onTap: (_index) {
          setState(() {
            _paginaActual.value = _index;
          });
        });
  }
}
