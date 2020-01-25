import 'package:flutter/material.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

class FloatingNavBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FloatingNavBarState();
  }
}

class FloatingNavBarState extends State<FloatingNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 30,
      currentIndex: 0,
      selectedItemColor: Theme.of(context).buttonColor,
      unselectedItemColor: Theme.of(context).backgroundColor,
      backgroundColor: Colors.white,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(GroovinMaterialIcons.apps), title: Text("Descubre")),
        BottomNavigationBarItem(
            icon: Icon(GroovinMaterialIcons.heart_box),
            title: Text("Guardados")),
        BottomNavigationBarItem(
            icon: Icon(GroovinMaterialIcons.ticket), title: Text("Compromisos")),
      ],
    );
  }
}
