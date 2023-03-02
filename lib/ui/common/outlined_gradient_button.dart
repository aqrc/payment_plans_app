import 'package:flutter/material.dart';

import '../../theme/custom_colors.dart';
import '../../theme/custom_theme.dart';

class OutlinedGradientButton extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  final BorderRadius borderRadius;
  final bool hasOutline;
  final bool hasGradient;

  factory OutlinedGradientButton.outlined({
    required String title,
    required void Function() onPressed,
  }) {
    return OutlinedGradientButton(
        title: title,
        onPressed: onPressed,
        hasOutline: true,
        hasGradient: false,
        borderRadius: const BorderRadius.all(Radius.circular(14)));
  }

  factory OutlinedGradientButton.gradient({
    required String title,
    required void Function() onPressed,
  }) {
    return OutlinedGradientButton(
        title: title,
        onPressed: onPressed,
        hasOutline: false,
        hasGradient: true,
        borderRadius: const BorderRadius.all(Radius.circular(5)));
  }

  factory OutlinedGradientButton.both({
    required String title,
    required void Function() onPressed,
  }) {
    return OutlinedGradientButton(
        title: title,
        onPressed: onPressed,
        hasOutline: true,
        hasGradient: true,
        borderRadius: const BorderRadius.all(Radius.circular(14)));
  }

  const OutlinedGradientButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.borderRadius = BorderRadius.zero,
    this.hasOutline = true,
    this.hasGradient = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Material(
        color: CustomColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: hasOutline
              ? const BorderSide(
                  color: CustomColors.green,
                  width: 2,
                )
              : BorderSide.none,
        ),
        child: Ink(
          height: 10,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            gradient: hasGradient
                ? const LinearGradient(
                    colors: [CustomColors.green, CustomColors.teal],
                  )
                : null,
          ),
          child: InkWell(
            borderRadius: borderRadius,
            onTap: onPressed,
            child: Center(
              child: Text(
                title.toUpperCase(),
                style: CustomTheme.textTheme.labelLarge?.copyWith(
                  color: hasGradient ? CustomColors.white : null,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
