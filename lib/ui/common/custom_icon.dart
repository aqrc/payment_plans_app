import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcon extends StatelessWidget {
  final String icon;
  final double size;

  const CustomIcon(
    this.icon, {
    Key? key,
    this.size = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      height: size,
    );
  }
}
