import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;

  final int? minLine;
  final int? maxLine;
  const CustomTextField({
    super.key,
    required this.controller,
    this.maxLine,
    this.minLine,
    required this.labelText,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: minLine,
      maxLines: maxLine,
      controller: controller,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          alignLabelWithHint: true,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)))),
    );
  }
}
