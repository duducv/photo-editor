import 'package:flutter/material.dart';
import 'package:perfect_face/components/SubMenu/temperature.dart';
import 'package:perfect_face/components/small_icon_text.dart';

class EditImageColors {
  _openTemperatureBar(BuildContext context) {
    showModalBottomSheet<void>(
        barrierColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return const Temperature();
        });
  }

  onPress(BuildContext context) {
    showModalBottomSheet<void>(
        barrierColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.only(left: 16),
            color: const Color(0xFF000000),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => _openTemperatureBar(context),
                  child: const SmallIconAndText(
                      title: 'Automático',
                      icon: Icon(
                        Icons.auto_awesome_rounded,
                        color: Color(0xFF9D9D9D),
                      )),
                ),
                const SmallIconAndText(
                    title: 'Preto e Branco',
                    icon: Icon(
                      Icons.filter_b_and_w_rounded,
                      color: Color(0xFF9D9D9D),
                    )),
                const SmallIconAndText(
                    title: 'Temperatura',
                    icon: Icon(
                      Icons.thermostat_rounded,
                      color: Color(0xFF9D9D9D),
                    ))
              ],
            ),
            width: double.infinity,
            height: 74,
          );
        });
  }
}
