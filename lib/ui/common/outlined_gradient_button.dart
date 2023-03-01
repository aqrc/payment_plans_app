import 'package:flutter/material.dart';

import '../../theme/custom_colors.dart';
import '../../theme/custom_theme.dart';

class OutlinedGradientButton extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  final BorderRadius? borderRadius;
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
        borderRadius: const BorderRadius.all(Radius.circular(14.5)));
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
        borderRadius: const BorderRadius.all(Radius.circular(14.5)));
  }

  const OutlinedGradientButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.borderRadius,
    this.hasOutline = true,
    this.hasGradient = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Material(
        borderRadius: borderRadius,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            gradient: hasGradient
                ? const LinearGradient(
                    colors: [CustomColors.green, CustomColors.teal],
                  )
                : null,
            border: hasOutline
                ? Border.all(
                    color: CustomColors.green,
                    width: 2,
                  )
                : null,
          ),
          child: InkWell(
            customBorder: borderRadius != null
                ? RoundedRectangleBorder(
                    borderRadius: borderRadius!,
                  )
                : null,
            onTap: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title.toUpperCase(),
                  style: CustomTheme.textTheme.labelLarge?.copyWith(
                    color: hasGradient ? CustomColors.white : null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
