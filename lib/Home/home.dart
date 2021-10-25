import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:perfect_face/ImageEditor/image_editor.dart';
import 'package:perfect_face/provider/image.dart';
import 'package:perfect_face/utils/image_convertions.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  _pickImageFromGallery(BuildContext context) async {
    try {
      final imageData =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imageData != null) {
        final imageAsBytes = await imageData.readAsBytes();
        final decodedImageFromBytes =
            await ImageConvertions().loadEncodedImageFromBytes(imageAsBytes);
        context.read<PictureProvider>().changeImageDimensions(
            decodedImageFromBytes.width, decodedImageFromBytes.height);
        final imagePixelsAsByteData = await decodedImageFromBytes.toByteData(
            format: ImageByteFormat.rawRgba);
        if (imagePixelsAsByteData != null) {
          final imagePixels = imagePixelsAsByteData.buffer.asUint8List();
          context.read<PictureProvider>().setSavedPixels(imagePixels);
          context.read<PictureProvider>().setTemporaryPixels(imagePixels);
          Navigator.of(context).push(
              MaterialPageRoute(builder: (builder) => const ImageEditor()));
        }
      }
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _pickImageFromGallery(context),
        child: const Icon(
          Icons.camera_alt_rounded,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Container(
          color: const Color(0xFF000000),
        ),
      ),
    );
  }
}
