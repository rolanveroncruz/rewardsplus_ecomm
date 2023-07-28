import 'package:flutter/material.dart';
import 'package:rewardsplus_ecomm/utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  final VoidCallback onClick;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  const AppIcon(
      {super.key,
      required this.icon,required this.onClick,
      this.backgroundColor = const Color(0xFFfcf4e4),
      this.iconColor = const Color(0xFF756d54),
      this.size = 40});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size / 2),
            color: backgroundColor,
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: Dimensions.iconSize16,
          )),
    );
  }
}
