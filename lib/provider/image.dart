import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'dart:ui' as ui;

class PictureProvider with ChangeNotifier, DiagnosticableTreeMixin {
  Uint8List? _temporaryPixels;
  Uint8List? _savedPixels;
  int? _imgOriginalWidth;
  int? _imgOriginalHeight;
  bool _temporaryPixelsInUse = false;
  double _temperatureSlider = 0;

  double get temperatureSlider => _temperatureSlider;
  Uint8List? get savedPixels => _savedPixels;
  Uint8List? get temporaryPixels => _temporaryPixels;
  bool get temporaryPixelsInUse => _temporaryPixelsInUse;
  int? get imgOriginalWidth => _imgOriginalWidth;
  int? get imgOriginalHeigth => _imgOriginalHeight;

  void changeTemperatureSlider(double value) {
    _temperatureSlider = value;
    notifyListeners();
  }

  void setSavedPixels(Uint8List pixels) {
    _savedPixels = pixels;
    notifyListeners();
  }

  void setTemporaryPixels(Uint8List pixels) {
    _temporaryPixels = pixels;
    notifyListeners();
  }

  void changeTemporaryPixelsInuse(bool value) {
    _temporaryPixelsInUse = value;
    notifyListeners();
  }

  void changeImageDimensions(int width, int height) {
    _imgOriginalWidth = width;
    _imgOriginalHeight = height;
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('count', _temperatureSlider));
  }
}
