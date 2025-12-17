import 'package:app_test1/pages/page_accueil.dart';
import 'package:app_test1/utils/routeur.dart';
import 'package:app_test1/utils/theme_perso.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MonAppli());
}

class MonAppli extends StatelessWidget {
  const MonAppli({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routeur.intialRoute,
      routes: Routeur.routes,
      theme: ThemePerso.themeClaire,
      darkTheme: ThemePerso.themeSombre,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (context) => PageAccueil()),
    );
  }
}
