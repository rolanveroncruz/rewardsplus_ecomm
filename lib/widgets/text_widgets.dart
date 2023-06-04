import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final TextOverflow overflow;
  const BigText({
    super.key,
    this.color = const Color(0xFF332d2b),
    required this.text,
    this.overflow = TextOverflow.ellipsis,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        overflow: overflow,
        style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.w400,
          fontFamily: 'Roboto',
          color: color,
        ));
  }
}

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final double height;
  const SmallText(
      {super.key,
      this.color = const Color(0xFFccc7c5),
      required this.text,
      this.size = 12,
      this.height = 1.2});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: 1,
        style: TextStyle(
          fontSize: size,
          fontFamily: 'Roboto',
          color: color,
          height: height,
        ));
  }
}
