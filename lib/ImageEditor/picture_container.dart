import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:perfect_face/provider/image.dart';
import 'package:perfect_face/utils/image_convertions.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;
import 'package:perfect_face/components/ImageCanvas/image_canvas.dart';

class PictureContainer extends StatelessWidget {
  const PictureContainer({Key? key}) : super(key: key);

  Future<ui.Image> _convertPixelToImageFromProvider(
      Uint8List pixels, int width, int height) async {
    final _img =
        await ImageConvertions().makeImageFromPixels(pixels, width, height);
    return _img;
  }

  @override
  Widget build(BuildContext context) {
    final pixels = context.watch<PictureProvider>().temporaryPixelsInUse
        ? context.read<PictureProvider>().temporaryPixels
        : context.read<PictureProvider>().savedPixels;
    final imgWidth = context.watch<PictureProvider>().imgOriginalWidth;
    final imgHeight = context.watch<PictureProvider>().imgOriginalHeigth;

    if (imgWidth != null && imgHeight != null && pixels != null) {
      return Container(
          color: const Color(0xFF000000),
          child: FittedBox(
            child: SizedBox(
              height: imgHeight.toDouble(),
              width: imgWidth.toDouble(),
              child: FutureBuilder<ui.Image>(
                future: _convertPixelToImageFromProvider(
                    pixels, imgWidth, imgHeight),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return CustomPaint(
                      painter: PictureCustomCanvas(img: snapshot.data!),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ));
    } else {
      return Container();
    }
  }
}
