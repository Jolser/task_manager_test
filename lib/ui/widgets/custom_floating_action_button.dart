import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final IconData icon;

  const CustomFloatingActionButton({
    Key? key,
    required this.onPressed,
    this.backgroundColor,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FadeInUp(
      child: FloatingActionButton(
        elevation: 12,
        backgroundColor: backgroundColor ?? theme.colorScheme.secondary,
        onPressed: onPressed,
        child: Icon(icon),
      ),
    );
  }
}
