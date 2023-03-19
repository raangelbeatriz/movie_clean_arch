import 'package:flutter/material.dart';

class ThemeConfig {
  ThemeConfig._();

  static ThemeData get theme => ThemeData(
      scaffoldBackgroundColor: Colors.black,
      iconTheme: const IconThemeData(color: Colors.white));
}
