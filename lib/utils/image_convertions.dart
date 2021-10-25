import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

class ImageConvertions {
  Future<ui.Image> loadEncodedImageFromBytes(Uint8List imageAsBytes) {
    final completer = Completer<ui.Image>();

    ui.decodeImageFromList(imageAsBytes, (result) {
      completer.complete(result);
    });
    return completer.future;
  }

  Future<ui.Image> makeImageFromPixels(Uint8List pixels, width, height) {
    final completer = Completer<ui.Image>();
    ui.decodeImageFromPixels(pixels, width, height, ui.PixelFormat.rgba8888,
        (result) {
      completer.complete(result);
    });
    return completer.future;
  }
}
