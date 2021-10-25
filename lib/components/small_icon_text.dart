import 'package:flutter/material.dart';

class SmallIconAndText extends StatelessWidget {
  const SmallIconAndText({Key? key, required this.title, required this.icon})
      : super(key: key);

  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          Text(
            title,
            style: const TextStyle(color: Color(0xFF9D9D9D), fontSize: 10),
          )
        ],
      ),
    );
  }
}
