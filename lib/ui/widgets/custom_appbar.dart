import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData? leadingIcon;
  final VoidCallback? onLeadingIconPressed;
  final Color? backgroundColor;
  final Color? iconColor;
  final TextStyle? textStyle;
  final bool action;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.leadingIcon,
    this.onLeadingIconPressed,
    this.backgroundColor,
    this.textStyle,
    this.iconColor, this.action = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      backgroundColor: backgroundColor,
      leading: leadingIcon != null
          ? IconButton(
              icon: Icon(leadingIcon),
              onPressed: onLeadingIconPressed ?? () => Navigator.pop(context),
              color: iconColor ?? theme.colorScheme.background,
            )
          : null,
      title: Text(
        title,
        style: textStyle ?? theme.textTheme.titleMedium,
      ),
      actions: action ? [
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {},
        ),
      ] : null,
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
