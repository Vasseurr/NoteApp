import 'package:flutter/material.dart';

import '../../constants/colors.dart';

// ignore: must_be_immutable
class YekTFF extends StatelessWidget {
  TextEditingController textEditingController;
  int maxLength;
  TextInputType keyboardType;
  String errorText;
  String labelText;
  String initialText;
  Color textColor;
  bool obsecureText;
  Color labelColor;

  double fontSize;
  int maxLines;
  Function(String) onChanged;
  Function(String value) onSaved;
  Function(String value) validator;

  YekTFF(
      {this.textEditingController,
      this.maxLength,
      this.keyboardType,
      this.errorText,
      this.labelText,
      this.initialText,
      this.onSaved,
      this.validator,
      this.fontSize,
      this.maxLines,
      this.onChanged,
      this.labelColor = MyColors.colorPrimary,
      this.textColor = Colors.black,
      this.obsecureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText,
      controller: textEditingController,
      onChanged: onChanged,
      initialValue: initialText ?? null,
      maxLines: maxLines ?? 1,
      maxLength: maxLength == null ? null : maxLength,
      keyboardType: keyboardType == null ? null : keyboardType,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide:
              const BorderSide(color: MyColors.colorPrimary, width: 2.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide:
              const BorderSide(color: MyColors.colorPrimary, width: 1.0),
        ),
        errorText: errorText == null ? null : errorText,
        border: OutlineInputBorder(),
        labelStyle: TextStyle(
            color: labelColor,
            fontFamily: "Poppins",
            fontSize: fontSize ?? 14,
            fontWeight: FontWeight.w500),
        labelText: labelText == null ? null : labelText,
      ),
      style: TextStyle(
        color: textColor,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
        fontSize: fontSize ?? 14,
      ),
      onSaved: onSaved,
      validator: validator,
    );
  }
}
