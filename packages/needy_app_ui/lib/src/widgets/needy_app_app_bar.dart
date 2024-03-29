import 'package:flutter/material.dart';
import 'package:needy_app_ui/needy_app_ui.dart';

/// {@template app_app_bar}
/// A custom app bar widget.
class NAAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// The AppBar if the user wants to add actions.
  NAAppBar.actionAppBar({
    super.key,
    this.textTitle,
    this.titleTextStyle,
    this.leading,
    this.backgroundColor,
    this.centerTitle,
    this.leadingWidth,
    this.buttonStyle,
  })  : toolbarHeight = 50,
        actions = <Widget>[
          TextButton(
            style: buttonStyle,
            onPressed: () {},
            child: const Text('Action 1'),
          ),
        ],
        elevation = 3,
        widgetTitle = Text(textTitle!),
        automaticallyImplyLeading = false;

  /// Red color AppBar.
  NAAppBar.redAppBar({
    super.key,
    this.textTitle,
    this.titleTextStyle,
    this.leading,
    this.actions,
    this.buttonStyle,
    this.backgroundColor = NAColors.red,
    this.automaticallyImplyLeading,
  })  : elevation = 5,
        widgetTitle = Text(textTitle!),
        centerTitle = true,
        toolbarHeight = 50,
        leadingWidth = 60;

  /// {@macro app_app_bar}
  const NAAppBar({
    super.key,
    this.widgetTitle,
    this.textTitle,
    this.titleTextStyle,
    this.leading,
    this.backgroundColor,
    this.elevation,
    this.centerTitle,
    this.toolbarHeight,
    this.leadingWidth,
    this.actions,
    this.buttonStyle,
    this.automaticallyImplyLeading,
  });

  NAAppBar.common({
    required BuildContext context,
    required String title,
    super.key,
    this.textTitle,
    this.titleTextStyle,
    this.elevation,
    this.centerTitle,
    this.toolbarHeight,
    this.leadingWidth,
    this.actions,
    this.buttonStyle,
    this.automaticallyImplyLeading,
  })  : backgroundColor = Colors.transparent,
        widgetTitle = Text(
          title,
          style: NATextStyle.caption.copyWith(color: NAColors.primary),
        ),
        leading = IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: NAColors.primary,
          ),
          onPressed: () => Navigator.of(context).pop(),
        );

  /// The text for the title of the app bar is a Text.
  final String? textTitle;

  /// The title of the app bar.
  final Widget? widgetTitle;

  /// The style of the title text.
  final TextStyle? titleTextStyle;

  /// The leading widget of the app bar.
  final Widget? leading;

  /// The background color of the app bar.
  final Color? backgroundColor;

  /// The elevation of the app bar.
  final double? elevation;

  /// Whether the title should be centered.
  final bool? centerTitle;

  /// The height of the app bar.
  final double? toolbarHeight;

  /// The width of the leading widget.
  final double? leadingWidth;

  /// The actions of the app bar.
  final List<Widget>? actions;

  /// The style of the button of actions from the appbar.
  final ButtonStyle? buttonStyle;

  /// Whether the leading widget should be automatically implied if set to false
  /// the automatic leading widget will not be shown.
  final bool? automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: widgetTitle,
      titleTextStyle: titleTextStyle ?? NATextStyle.display2,
      leading: leading,
      backgroundColor: backgroundColor ?? NAColors.primary,
      elevation: elevation ?? 0,
      centerTitle: centerTitle,
      toolbarHeight: toolbarHeight,
      leadingWidth: leadingWidth,
      actions: actions,
      automaticallyImplyLeading: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
