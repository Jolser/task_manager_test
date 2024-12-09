import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CommonTextField extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      initialValue: initialValue,
      enabled: enabled,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      controller: controller,
      maxLines: maxLines,
      maxLength: maxLength,
      onTap: onTap,
      onChanged: onChanged,
      readOnly: readOnly,
      style: style ?? theme.textTheme.bodyLarge,
      decoration: decoration ??
          InputDecoration(
            hintText: hintText,
            labelText: labelText,
            helperText: helperText,
            suffixIcon: suffixIcon,
            labelStyle: labelstyle ??
                theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
            hintStyle: theme.textTheme.bodyLarge!.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            icon: icon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
    );
  }
  final bool readOnly;
  final Function(String)? onChanged;
  final int maxLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final String? helperText;
  final String? hintText;
  final String? initialValue;
  final Widget? suffixIcon;
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final Widget? icon;
  final InputDecoration? decoration;
  final TextStyle? style;
  final TextStyle? labelstyle;
  final bool enabled;

  const CommonTextField({
    Key? key,
    this.controller,
    this.helperText,
    this.hintText,
    this.icon,
    this.initialValue,
    this.inputFormatters,
    this.keyboardType,
    this.labelText,
    this.maxLength,
    this.maxLines = 1,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
    this.decoration,
    this.style,
    this.labelstyle,
    this.enabled = true, this.suffixIcon,
  }) : super(key: key);
}
