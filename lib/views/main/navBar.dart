import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

class FloatingNavBar extends StatelessWidget {
  final ValueNotifier<int> _paginaActual;
  FloatingNavBar(this._paginaActual);

  @override
  Widget build(BuildContext context) {
    final double _defaultSizeIcon = 30;
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: _paginaActual.value,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(
            'res/home_color.svg',
            height: _defaultSizeIcon,
          ),
          icon: SvgPicture.asset(
            'res/home_black.svg',
            height: _defaultSizeIcon,
          ),
          title: Text("Descubre"),
        ),
        BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'res/heart_color.svg',
              height: _defaultSizeIcon,
            ),
            icon: SvgPicture.asset(
              'res/heart_black.svg',
              height: _defaultSizeIcon,
            ),
            title: Text("Guardados")),
        BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'res/ticket_color.svg',
              height: _defaultSizeIcon,
            ),
            icon: SvgPicture.asset(
              'res/ticket_black.svg',
              height: _defaultSizeIcon,
            ),
            title: Text("Compromisos")),
      ],
      onTap: (_index) {
        _paginaActual.value = _index;
      },
    );
  }
}
