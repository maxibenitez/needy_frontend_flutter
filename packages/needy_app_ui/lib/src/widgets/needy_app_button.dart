import 'package:flutter/material.dart';
import 'package:needy_app_ui/needy_app_ui.dart';

class NAButton extends StatelessWidget {
  const NAButton({
    super.key,
    this.backgroundColor,
    required this.text,
    this.textColor,
    this.onPressed,
    this.borderColor,
    this.icon,
  });

  /// Primary button which background color is the primary color of the theme
  const NAButton.primary({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
  })  : backgroundColor = NAColors.primary,
        borderColor = NAColors.primary,
        textColor = NAColors.white;

  /// Secondary button which background color is the secondary color of the theme
  const NAButton.secondary({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
  })  : backgroundColor = NAColors.white,
        borderColor = NAColors.white,
        textColor = NAColors.oceanBlue;

  /// Tertiary button which background color is the lightblue color
  const NAButton.tertiary({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
  })  : backgroundColor = NAColors.lightBlue200,
        borderColor = null,
        textColor = NAColors.oceanBlue;

  const NAButton.red({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
  })  : backgroundColor = NAColors.red,
        borderColor = NAColors.red,
        textColor = NAColors.white;

  const NAButton.home({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
  })  : backgroundColor = NAColors.darkAqua,
        borderColor = null,
        textColor = NAColors.white;

  /// Text on the button
  final String text;

  /// Callback when the button is pressed
  final VoidCallback? onPressed;

  /// Background color of the button
  final Color? backgroundColor;

  /// Text color of the button
  final Color? textColor;

  /// Border color of the button
  final Color? borderColor;

  /// Icon on the button
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 48,
      width: 320,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape: const StadiumBorder(),
          shadowColor: Colors.transparent,
          textStyle: theme.textTheme.labelLarge,
          side: BorderSide(
            width: 2,
            color: borderColor ?? Colors.transparent,
          ),
        ),
        child: icon ??
            Text(
              text,
              textAlign: TextAlign.center,
              style: theme.textTheme.labelLarge?.copyWith(
                color: textColor,
              ),
            ),
      ),
    );
  }
}
