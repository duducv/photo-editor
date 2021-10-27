// ignore_for_file: file_names
import 'dart:io';
import 'dart:ffi'; // For FFI
import 'package:ffi/ffi.dart';
import 'dart:typed_data';

final DynamicLibrary nativeImageProcessing = Platform.isAndroid
    ? DynamicLibrary.open("libimageprocessing.so")
    : DynamicLibrary.process();

final Pointer<Uint8> Function(
        Pointer<Uint8> data, int len, int red, int width, int height)
    nativeTemperature = nativeImageProcessing
        .lookup<
            NativeFunction<
                Pointer<Uint8> Function(
                    Pointer<Uint8>, Int32, Int32, Int32, Int32)>>("temperature")
        .asFunction();

final Pointer<Uint8> Function(Pointer<Uint8> data, int len, int red)
    nativeExposure = nativeImageProcessing
        .lookup<
            NativeFunction<
                Pointer<Uint8> Function(
                    Pointer<Uint8>, Int32, Int32)>>("exposure")
        .asFunction();

final Pointer<Uint8> Function(Pointer<Uint8> data, int len, int red)
    nativeTint = nativeImageProcessing
        .lookup<
            NativeFunction<
                Pointer<Uint8> Function(Pointer<Uint8>, Int32, Int32)>>("tint")
        .asFunction();

class FFI {
  Uint8List greenChannel(
      Uint8List imageAsBytes, int sliderValue, int width, int height) {
    final Pointer<Uint8> allocation =
        malloc.allocate<Uint8>(imageAsBytes.length);
    allocation.asTypedList(imageAsBytes.length).setAll(0, imageAsBytes);
    final pointerResult = nativeTemperature(
        allocation, imageAsBytes.length, sliderValue, width, height);
    final result = pointerResult.asTypedList(imageAsBytes.length);
    malloc.free(allocation);
    return result;
  }

  Uint8List exposure(Uint8List imageAsBytes, int exposureValue) {
    final Pointer<Uint8> allocation =
        malloc.allocate<Uint8>(imageAsBytes.length);
    allocation.asTypedList(imageAsBytes.length).setAll(0, imageAsBytes);
    final pointerResult =
        nativeExposure(allocation, imageAsBytes.length, exposureValue);
    final result = pointerResult.asTypedList(imageAsBytes.length);
    malloc.free(allocation);
    return result;
  }

  Uint8List tint(Uint8List imageAsBytes, int tintValue) {
    final Pointer<Uint8> allocation =
        malloc.allocate<Uint8>(imageAsBytes.length);
    allocation.asTypedList(imageAsBytes.length).setAll(0, imageAsBytes);
    final pointerResult =
        nativeTint(allocation, imageAsBytes.length, tintValue);
    final result = pointerResult.asTypedList(imageAsBytes.length);
    malloc.free(allocation);
    return result;
  }
}
