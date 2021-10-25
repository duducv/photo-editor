import 'package:flutter/material.dart';
import 'package:perfect_face/ImageEditor/picture_container.dart';
import 'package:perfect_face/components/footer.dart';

class ImageEditor extends StatelessWidget {
  const ImageEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            Expanded(
              child: PictureContainer(),
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}
