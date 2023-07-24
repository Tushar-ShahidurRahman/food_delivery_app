import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/dimensions.dart';

// This class is a reusable class for App icon in the app.
class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final double iconSize;
  final double size;

  AppIcon({
    Key? key,
    required this.icon,
    this.iconColor = const Color(0xff756d54),
    this.backgroundColor = const Color(0xfffcf4e4),
    this.iconSize = 0,
    this.size = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size == 0 ? Dimensions.height36 : size,
      height: size == 0 ? Dimensions.height36 : size,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(Dimensions.height36 / 2)),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize == 0 ? Dimensions.iconSize16 : iconSize,
      ),
    );
  }
}
