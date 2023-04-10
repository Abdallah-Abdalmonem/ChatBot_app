
import 'package:flutter/material.dart';

Widget defuiltTextButtom(
    {required VoidCallback? onpressed, required String text}
    ) {
  return TextButton(
    onPressed: onpressed,
    child: Text(text.toUpperCase()),
  );
}
