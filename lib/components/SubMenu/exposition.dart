import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:perfect_face/FFI/ffi.dart';
import 'package:perfect_face/components/save_changes_banner.dart';
import 'package:perfect_face/controller/image_controller.dart';

class Exposure extends StatelessWidget {
  Exposure({Key? key}) : super(key: key);
  final controller = Get.put(ImageController());

  _onSliderChange(double value) {
    final modifiedPixels =
        FFI().exposure(controller.backupPixels!, value.round());
    controller.actualPixels!.setAll(0, modifiedPixels);
    controller.changeSlidervalue(value);
  }

  @override
  Widget build(BuildContext context) {
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
                      Icons.exposure_minus_1,
                      color: Color(0xFF9D9D9D),
                    ),
                    GetBuilder<ImageController>(
                        builder: (_) => (CupertinoSlider(
                              min: 0,
                              max: 100,
                              value: controller.temperatureSliderValue,
                              onChanged: _onSliderChange,
                            ))),
                    const Icon(
                      Icons.exposure_plus_1,
                      color: Color(0xFF9D9D9D),
                    )
                  ],
                )
              ],
            ),
          ),
          SaveChangesBanner()
        ],
      ),
    );
  }
}
