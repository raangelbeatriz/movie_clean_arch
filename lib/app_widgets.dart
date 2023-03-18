import 'package:flutter/material.dart';
import 'package:movie_clean_arch/core/ui/theme_config.dart';

import 'core/application_bindings/application_bindings.dart';

class AppWidgets extends StatelessWidget {
  const AppWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ApplicationBindings(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeConfig.theme,
        title: 'Movie App',
        home: Scaffold(
          body: Container(),
        ),
      ),
    );
  }
}
