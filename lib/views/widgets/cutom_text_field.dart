import 'package:flutter/material.dart';

class customTextFiled extends StatelessWidget {
  customTextFiled({
    required this.hintText,
    required this.textController,
    super.key,
  });
  String hintText;
  TextEditingController textController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      minLines: 5,
      maxLines: 20,
      style: const TextStyle(
        fontSize: 20,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        label: Text(hintText),
        filled: true,
      ),
    );
  }
}
