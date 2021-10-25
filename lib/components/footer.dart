import 'package:flutter/material.dart';
import 'package:perfect_face/components/SubMenu/edit_image_colors.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onTap(int index) {
      if (index == 1) {
        EditImageColors().onPress(context);
      }
    }

    return BottomNavigationBar(
      onTap: _onTap,
      selectedFontSize: 12,
      selectedItemColor: Colors.white,
      unselectedItemColor: const Color(0xFF9D9D9D),
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.face_outlined), label: 'Moldar'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Editar'),
        BottomNavigationBarItem(icon: Icon(Icons.style), label: 'Preset'),
      ],
      backgroundColor: const Color(0xFF000000),
    );
  }
}
