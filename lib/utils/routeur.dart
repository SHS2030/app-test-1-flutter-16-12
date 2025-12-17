import 'package:app_test1/pages/page_accueil.dart';
import 'package:app_test1/pages/page_boutique.dart';
import 'package:app_test1/pages/page_compteur.dart';
import 'package:app_test1/pages/page_details_profil.dart';
import 'package:flutter/material.dart';

abstract class Routeur {
  static const String intialRoute = "/page-compteur";

  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    intialRoute: (context) => const PageCompteur(),
    "/page-accueil": (context) => const PageAccueil(),
    "/page-details-profil": (context) => const PageDetailsProfil(),
    "/page-boutique": (context) => const PageBoutique(),
  };
}