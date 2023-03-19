import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:movie_clean_arch/core/ui/theme_config.dart';
import 'package:movie_clean_arch/feature/movie/presentation/ui/page/movie_details_page.dart';

import 'core/application_bindings/application_bindings.dart';
import 'core/routes/routes.dart';

class AppWidgets extends StatelessWidget {
  const AppWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ApplicationBindings(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeConfig.theme,
        title: 'Movie App',
        initialRoute: Routes.movieDetails,
        routes: {Routes.movieDetails: (context) => const MovieDetailsPage()},
        builder: Asuka.builder,
      ),
    );
  }
}
