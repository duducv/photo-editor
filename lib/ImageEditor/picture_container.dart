import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:perfect_face/components/ImageCanvas/image_canvas.dart';
import 'dart:ui' as ui;
import 'package:perfect_face/controller/image_controller.dart';
import 'package:perfect_face/utils/image_convertions.dart';

class PictureContainer extends StatefulWidget {
  const PictureContainer({Key? key}) : super(key: key);

  @override
  State<PictureContainer> createState() => _PictureContainerState();
}

class _PictureContainerState extends State<PictureContainer> {
  final controller = Get.put(ImageController());
  ui.Image? image;

  @override
  void initState() {
    super.initState();
    setState(() {
      ImageConvertions()
          .makeImageFromPixels(controller.actualPixels!, controller.imgWidth,
              controller.imgHeight)
          .then((value) => setState(() {
                image = value;
              }));
    });
  }

  _updateImage() {
    print("red ${controller.actualPixels![0]}");
    print("green ${controller.actualPixels![1]}");
    print("blue ${controller.actualPixels![2]}");
    print("alfa ${controller.actualPixels![3]}");
    ImageConvertions()
        .makeImageFromPixels(
            controller.actualPixels!, image!.width, image!.height)
        .then((value) => {
              setState(() {
                image = value;
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    if (image != null) {
      return Container(
          color: const Color(0xFF121212),
          child: FittedBox(child: GetBuilder<ImageController>(
            builder: (_) {
              _updateImage();
              return SizedBox(
                height: image!.height.toDouble(),
                width: image!.width.toDouble(),
                child: CustomPaint(
                  painter: PictureCustomCanvas(img: image!),
                ),
              );
            },
          )));
    } else {
      return Container();
    }
  }
}
