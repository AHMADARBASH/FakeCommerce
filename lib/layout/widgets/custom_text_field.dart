// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  bool isPassword;
  Widget? suffix;
  String lable;
  TextInputAction? action;
  CustomTextField({
    required this.lable,
    required this.isPassword,
    this.suffix,
    this.action,
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
      ),
    );
  }
}
