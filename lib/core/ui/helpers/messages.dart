import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Messages {
  final BuildContext context;
  Messages._(this.context);

  factory Messages.of(BuildContext context) {
    return Messages._(context);
  }

  void showError(String message) {
    showTopSnackBar(
        Overlay.of(context), CustomSnackBar.error(message: message));
  }

  void showInfo(String message) {
    showTopSnackBar(Overlay.of(context), CustomSnackBar.info(message: message));
  }

  void showSuccess(String message) {
    showTopSnackBar(
        Overlay.of(context), CustomSnackBar.success(message: message));
  }
}
