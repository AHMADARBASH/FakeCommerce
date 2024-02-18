// ignore_for_file: must_be_immutable

import 'package:fakecommerce/utilities/context_extenstions.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  bool isPassword;
  Widget? suffix;
  String lable;
  TextInputAction? action;
  String? Function(String?) validator;
  TextEditingController? controller;
  CustomTextField({
    required this.lable,
    required this.isPassword,
    required this.validator,
    this.suffix,
    this.action,
    this.controller,
    super.key,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword,
      textInputAction: widget.action,
      enabled: true,
      validator: widget.validator,
      controller: widget.controller,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        suffixIcon: widget.suffix,
        fillColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        enabled: true,
        filled: true,
        hintText: widget.lable,
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
            ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          borderSide: BorderSide(width: 0, color: Colors.transparent),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          borderSide: BorderSide(width: 0, color: Colors.transparent),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          borderSide: BorderSide(
            width: 1,
            color: context.errorColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          borderSide: BorderSide(
            width: 1,
            color: context.errorColor,
          ),
        ),
      ),
    );
  }
}
