import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class AddProductsTextFields extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? validationText;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextInputType textinput;

  AddProductsTextFields({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validationText,
    required this.formKey,
    required this.textinput,
  });

  @override
  State<AddProductsTextFields> createState() => _AddProductsTextFieldsState();
}

class _AddProductsTextFieldsState extends State<AddProductsTextFields> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.textinput,
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
        labelStyle: TextStyle(color: Colors.white),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: 16.sp,
          color: Colors.white,
          fontWeight: FontWeight.bold,
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
