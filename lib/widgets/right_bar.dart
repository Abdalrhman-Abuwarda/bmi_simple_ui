import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

class RighrBar extends StatelessWidget {
  final double barWidth;

  const RighrBar({Key? key, required this.barWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 25,
          width: barWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: accentHexColor
          ),
        )
      ],
    );
  }
}
