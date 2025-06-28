import 'package:flutter/material.dart';

class CustomtextformField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final int? maxLines;
  final bool enabled;
  final Color fillColor;
  final double borderRadius;
  final EdgeInsetsGeometry contentPadding;
  final InputDecoration? decoration;
  final void Function()? onTap;

  const CustomtextformField({
    Key? key,
    required this.controller,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.maxLines = 1,
    this.enabled = true,
    this.fillColor = const Color(0xFFF5F5F5),
    this.borderRadius = 12.0,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 14,
    ),
    this.decoration,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      enabled: enabled,
      decoration:
          decoration ??
          InputDecoration(
            filled: true,
            fillColor: fillColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide.none,
            ),
            contentPadding: contentPadding,
          ),
      validator: validator,
      onChanged: onChanged,
      onTap: onTap,
    );
  }
}
