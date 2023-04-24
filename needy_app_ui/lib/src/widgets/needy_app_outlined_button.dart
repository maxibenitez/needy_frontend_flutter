import 'package:flutter/material.dart';
import 'package:needy_app_ui/needy_app_ui.dart';

class NAOutlinedButton extends StatelessWidget {
  const NAOutlinedButton({
    super.key,
    this.backgroundColor,
    required this.text,
    this.textColor,
    this.onPressed,
    this.borderColor,
    this.icon,
  });

  /// Primary button which background color is the primary color of the theme
  const NAOutlinedButton.primary({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
  })  : backgroundColor = NAColors.oceanBlue,
        borderColor = NAColors.oceanBlue,
        textColor = NAColors.white;

  /// Secondary button which background color is the secondary color of the theme
  const NAOutlinedButton.secondary({
    super.key,
    required this.text,
    this.icon,
  })  : backgroundColor = NAColors.grey,
        onPressed = null,
        borderColor = NAColors.white,
        textColor = NAColors.white;

  const NAOutlinedButton.red({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
  })  : backgroundColor = NAColors.red,
        borderColor = NAColors.red,
        textColor = NAColors.white;

  const NAOutlinedButton.home({
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
    final isInactive = onPressed == null;
    final theme = Theme.of(context);
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        disabledBackgroundColor: theme.colorScheme.background,
        backgroundColor: backgroundColor,
        side: borderColor == null
            ? null
            : BorderSide(
                color: onPressed == null
                    ? (theme.colorScheme.onBackground)
                    : borderColor!,
              ),
        padding: const EdgeInsets.symmetric(
          horizontal: NASpacing.md,
          vertical: NASpacing.md,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: icon,
            ),
          SizedBox(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: NATextStyle.button.copyWith(
                color:
                    isInactive ? (theme.colorScheme.onBackground) : textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
