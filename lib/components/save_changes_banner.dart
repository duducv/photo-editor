import 'package:flutter/material.dart';
import 'package:perfect_face/components/small_icon_text.dart';

class SaveChangesBanner extends StatelessWidget {
  const SaveChangesBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 12, 24, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          SmallIconAndText(
              title: 'Salvar',
              icon: Icon(
                Icons.check,
                color: Colors.white,
              )),
          SmallIconAndText(
              title: 'Retornar',
              icon: Icon(
                Icons.undo_rounded,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
