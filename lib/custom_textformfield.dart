library custom_textformfield;

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String fieldTitle;
  final TextEditingController textController;
  final Color textColor;
  final Color cursorColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color backgroundColor;
  final double fieldTitleSize;
  final double textSize;
  final InputDecoration? inputDecoration;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final bool errorFlag;
  final String errorText;

  const CustomTextFormField({
    super.key,
    required this.fieldTitle,
    required this.fieldTitleSize,
    required this.textSize,
    required this.textController,
    this.textColor = Colors.black,
    this.cursorColor = Colors.black,
    this.borderColor = Colors.grey,
    this.focusedBorderColor = Colors.blue,
    this.backgroundColor = Colors.white,
    this.inputDecoration,
    this.keyboardType,
    this.readOnly = false,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    required this.errorFlag,
    required this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldTitle,
          style: TextStyle(
            color: Colors.white,
            fontSize: fieldTitleSize,
            fontFamily: 'Gilroy Regular',
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            color: backgroundColor,
            border: Border.all(color: borderColor),
          ),
          height: 50,
          child: TextFormField(
            style: TextStyle(
              fontSize: textSize,
              fontFamily: 'Gilroy Medium',
              color: textColor,
            ),
            cursorColor: cursorColor,
            controller: textController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              border: const OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(6)),
                borderSide: BorderSide(color: focusedBorderColor, width: 1),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Visibility(
          visible: errorFlag,
          child: Text(
            '$errorText*',
            style: const TextStyle(fontFamily: 'Gilroy Regular', fontSize: 18, color: Color(0xffFCB710)),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
