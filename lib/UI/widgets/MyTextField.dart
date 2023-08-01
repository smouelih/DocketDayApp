// ignore_for_file: must_be_immutable, file_names, prefer_typing_uninitialized_variables

import 'package:docketday/Theme/Theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MyTextField extends StatelessWidget {
  MyTextField({
    super.key,
    required this.hint,
    this.helperText,
    this.suffixIcon,
    this.controller,
    required this.readonly,
    this.suffixIconClick,
    this.maxLines,
    this.textType,
    this.validate,
  });

  String hint;
  String? helperText;
  IconData? suffixIcon;
  Function()? suffixIconClick;

  int? maxLines;

  var validate;

  bool readonly;

  TextInputType? textType;

  TextEditingController? controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$helperText',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: mainColor,
          ),
        ),
        TextFormField(
          validator: validate,
          keyboardType: textType,
          maxLines: maxLines,
          readOnly: readonly,
          decoration: InputDecoration(
            suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: IconButton(
                  onPressed: suffixIconClick,
                  icon: FaIcon(
                    suffixIcon,
                    color: mainColor,
                  ),
                )),
            hintText: hint,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  BorderSide(color: Get.isDarkMode ? Colors.grey : mainColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  BorderSide(color: Get.isDarkMode ? Colors.grey : mainColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.red),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}
