import 'package:flutter/material.dart';
import 'package:solidair/config/palette.dart';

import '../config/app_text.dart';

class InfosColumn extends StatelessWidget {
  const InfosColumn({
    super.key,
    this.height = 45,
    this.width = double.infinity,
    required this.label,
    this.color = Colors.grey,
    required this.widget,
    this.opacity = 0,
    this.isBottomBorder = false,
  });
  final double height;
  final double width;
  final String label;
  final Color color;
  final Widget widget;
  final double opacity;
  final bool isBottomBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 4.0),
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: color.withOpacity(opacity),
          borderRadius: !isBottomBorder ? BorderRadius.circular(5) : null,
          border: isBottomBorder
              ? Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Palette.greyColor.withOpacity(0.5),
                  ),
                )
              : null),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.small(
            label,
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
          widget,
        ],
      ),
    );
  }
}
