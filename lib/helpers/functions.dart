import 'package:flutter/material.dart';
import 'package:kafaa_app/helpers/extensions/build_context_extensions.dart';

class HelperFunctions {
  static void loadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  static void successSnackBar(BuildContext context, String message) {
    context.clearSnackBars();
    context.showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  static void failureSnackBar(BuildContext context, String message) {
    context.clearSnackBars();
    context.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
}
