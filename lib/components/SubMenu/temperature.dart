import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perfect_face/FFI/ffi.dart';
import 'package:perfect_face/components/save_changes_banner.dart';
import 'package:perfect_face/provider/image.dart';
import 'package:provider/provider.dart';

class Temperature extends StatelessWidget {
  const Temperature({Key? key}) : super(key: key);

  _onSlideChanged(double value, BuildContext context, Uint8List pixels) {
    print(value);
    context.read<PictureProvider>().changeTemperatureSlider(value);
    context.read<PictureProvider>().changeTemporaryPixelsInuse(true);
    final changedPixels = FFI().greenChannel(pixels, value.round());
    context.read<PictureProvider>().setTemporaryPixels(changedPixels);
  }

  @override
  Widget build(BuildContext context) {
    final sliderValue = context.watch<PictureProvider>().temperatureSlider;
    final temporaryPixels = context.watch<PictureProvider>().temporaryPixels;
    return Container(
      height: 140,
      color: Colors.black,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(
                      Icons.ac_unit,
                      color: Color(0xFF9D9D9D),
                    ),
                    CupertinoSlider(
                      min: 0,
                      max: 255,
                      value: sliderValue,
                      onChanged: (double value) {
                        _onSlideChanged(value, context, temporaryPixels!);
                      },
                    ),
                    const Icon(
                      Icons.thermostat,
                      color: Color(0xFF9D9D9D),
                    )
                  ],
                )
              ],
            ),
          ),
          const SaveChangesBanner()
        ],
      ),
    );
  }
}
