import 'package:fakecommerce/utilities/context_extenstions.dart';
import 'package:flutter/material.dart';

void showSnackbar(
    {required BuildContext context,
    required String content,
    SnackBarAction? action}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
      ),
      backgroundColor: context.secondaryColor,
      action: action,
    ),
  );
}
