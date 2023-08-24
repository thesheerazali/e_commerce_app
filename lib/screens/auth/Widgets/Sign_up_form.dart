import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class SignUpTextFields extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String validationText;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignUpTextFields(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.validationText,
      required this.formKey});

  @override
  State<SignUpTextFields> createState() => _SignUpTextFieldsState();
}

class _SignUpTextFieldsState extends State<SignUpTextFields> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your ${widget.validationText}';
        }
        return null;
      },
      onChanged: (value) {
        // Clear validation error when user starts typing
        if (widget.formKey.currentState!.validate()) {
          setState(() {
            // This will trigger a rebuild and revalidate the form
          });
        }
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: 16.sp,
          color: Colors.white,
        ),
        filled: true,
        fillColor: Colors.black.withOpacity(0.4),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
