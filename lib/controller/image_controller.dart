import 'dart:typed_data';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ImageController extends GetxController {
  Uint8List? backupPixels;
  Uint8List? actualPixels;
  int? imgWidth;
  int? imgHeight;
  double temperatureSliderValue = 50;

  changeSavedPixels(Uint8List pixels, int width, int height) {
    actualPixels = Uint8List(pixels.length);
    actualPixels!.setAll(0, pixels);
    backupPixels = pixels;
    imgWidth = width;
    imgHeight = height;
    update();
  }

  changeActualPixels(Uint8List pixels) {
    actualPixels = pixels;
  }

  backupActualPixels() {
    backupPixels!.setAll(0, actualPixels!);
  }

  discardActualPixels() {
    actualPixels!.setAll(0, backupPixels!);
  }

  changeSlidervalue(double value) {
    temperatureSliderValue = value;
    update();
  }
}
