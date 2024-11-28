import 'package:flutter/material.dart';
import 'package:not_hive_app/const/colors.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({
    super.key,
    required this.hint,
    this.maxLine = 1,
    this.onSave,
    this.onChanged,
  });
  final void Function(String)? onChanged;
  final String hint;
  final int maxLine;
  final void Function(String?)? onSave;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSave,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return ' Filed is required';
        } else {
          return null;
        }
      },
      maxLines: maxLine,
      decoration: InputDecoration(
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(primryColor),
        hintText: hint,
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: color ?? Colors.white));
  }
}
