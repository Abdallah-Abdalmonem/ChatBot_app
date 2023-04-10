import 'package:flutter/material.dart';

Widget defaultTextFormField({
  required String labelText,
  required TextEditingController textController,
  VoidCallback? Function(String?)? onFieldSubmitted,
  VoidCallback? Function(String?)? onChanged,
  String? Function(String?)? validater,
  IconData? suffix,
  IconData? prefixIcone,
  bool isPassword = false,
  VoidCallback? onTap,
}) =>
    TextFormField(
      onTap: onTap,
      controller: textController,
      validator: validater,
      keyboardType: TextInputType.visiblePassword,
      obscureText: isPassword,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        prefixIcon: Icon(prefixIcone),
        suffix: Icon(suffix),
      ),
    );
