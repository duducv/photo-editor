// ignore_for_file: file_names
import 'dart:io';
import 'dart:ffi'; // For FFI
import 'package:ffi/ffi.dart';
import 'dart:typed_data';

final DynamicLibrary nativeImageProcessing = Platform.isAndroid
    ? DynamicLibrary.open("libimageprocessing.so")
    : DynamicLibrary.process();

final Pointer<Uint8> Function(Pointer<Uint8> data, int len, int red)
    nativeRedChannel = nativeImageProcessing
        .lookup<
            NativeFunction<
                Pointer<Uint8> Function(
                    Pointer<Uint8>, Int32, Int32)>>("red_channel")
        .asFunction();

class FFI {
  Uint8List greenChannel(Uint8List imageAsBytes, int channelValue) {
    final Pointer<Uint8> allocation =
        malloc.allocate<Uint8>(imageAsBytes.length);
    allocation.asTypedList(imageAsBytes.length).setAll(0, imageAsBytes);
    final pointerResult =
        nativeRedChannel(allocation, imageAsBytes.length, channelValue);
    final result = pointerResult.asTypedList(imageAsBytes.length);
    malloc.free(allocation);
    return result;
  }
}
