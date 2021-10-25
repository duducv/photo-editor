import 'package:flutter/material.dart';

class ImageEditor extends StatelessWidget {
  const ImageEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(),
            ),
            BottomNavigationBar(
              selectedItemColor: Colors.white,
              unselectedItemColor: const Color(0xFF9D9D9D),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.face_outlined), label: 'Moldar'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'Editar'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.style), label: 'Preset'),
              ],
              backgroundColor: const Color(0xFF000000),
            )
          ],
        ),
      ),
    );
  }
}
