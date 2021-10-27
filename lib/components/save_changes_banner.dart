import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:perfect_face/components/small_icon_text.dart';
import 'package:perfect_face/controller/image_controller.dart';

class SaveChangesBanner extends StatelessWidget {
  SaveChangesBanner({Key? key}) : super(key: key);

  final controller = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 12, 24, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => controller.backupActualPixels(),
            child: const SmallIconAndText(
                title: 'Salvar',
                icon: Icon(
                  Icons.check,
                  color: Colors.white,
                )),
          ),
          InkWell(
            onTap: () => controller.discardActualPixels(),
            child: const SmallIconAndText(
                title: 'Retornar',
                icon: Icon(
                  Icons.undo_rounded,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}
