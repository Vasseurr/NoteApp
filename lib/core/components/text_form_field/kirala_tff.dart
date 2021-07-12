import 'package:flutter/material.dart';

import '../../constants/colors.dart';

// ignore: must_be_immutable
class KiralaTFF extends StatelessWidget {
  TextEditingController textEditingController;
  int maxLength;
  TextInputType keyboardType;
  String errorText;
  TextInputAction textInputAction;
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

  KiralaTFF(
      {this.textEditingController,
      this.maxLength,
      this.keyboardType,
      this.errorText,
      this.labelText,
      this.initialText,
      this.onSaved,
      this.validator,
      this.fontSize,
      this.textInputAction,
      this.maxLines,
      this.onChanged,
      this.labelColor = MyColors.colorPrimary,
      this.textColor = Colors.black,
      this.obsecureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction ?? null,
      obscureText: obsecureText,
      controller: textEditingController,
      onChanged: onChanged,
      initialValue: initialText ?? null,
      maxLines: maxLines ?? 1,
      maxLength: maxLength == null ? null : maxLength,
      keyboardType: keyboardType == null ? null : keyboardType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide.none,
        ),
        fillColor: Color(0xffcccccc).withOpacity(0.5),
        filled: true,
        labelStyle: TextStyle(
            color: labelColor,
            fontFamily: "Poppins",
            fontSize: fontSize ?? 14,
            fontWeight: FontWeight.w500),
        errorText: errorText == null ? null : errorText,
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
