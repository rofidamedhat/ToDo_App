// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todo_list/core/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.title,
    required this.label,
    this.maxLines = 1,
  }) : super(key: key);
  final String title;
  final Widget label;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            const EdgeInsets.only(left: 10, right: 10, bottom: 25, top: 10),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 1.3),
          borderRadius: BorderRadius.circular(16.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 255, 238, 238), width: 1.3),
          borderRadius: BorderRadius.circular(16.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.3),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.3),
          borderRadius: BorderRadius.circular(16.0),
        ),
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
        hintText: title,
        label: label,
        fillColor: AppColors.white,
        filled: true,
      ),
      // style: const TextStyle(fontSize: 20, color: AppColors.primaryColor),
      maxLines: maxLines,
    );
  }
}
