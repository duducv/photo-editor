import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perfect_face/components/save_changes_banner.dart';
import 'package:perfect_face/provider/image.dart';
import 'package:provider/provider.dart';

class Temperature extends StatelessWidget {
  const Temperature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sliderValue = context.watch<PictureProvider>().temperatureSlider;
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
                        value: sliderValue,
                        onChanged: (double value) {
                          context
                              .read<PictureProvider>()
                              .changeTemperatureSlider(value);
                        }),
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
