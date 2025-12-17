import 'package:app_test1/components/end_drawer_perso.dart';
import 'package:flutter/material.dart';

class PageCompteur extends StatefulWidget {
  const PageCompteur({super.key});

  @override
  State<PageCompteur> createState() => _PageCompteurState();
}

class _PageCompteurState extends State<PageCompteur> {
  int _compteur = 0;

  @override
  Widget build(BuildContext context) {
    print("Construction de la page compteur");
    return Scaffold(
      endDrawer: EndDrawerPerso(),
      appBar: AppBar(
        title: const Text("Page Compteur"),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
      ),
      body: Center(
        child: SafeArea(
          bottom: true,
          child: Container(
            margin: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Theme.of(context).colorScheme.primary,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Compteur",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  "$_compteur",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        onPressed: () {
          setState(() {
            _compteur++;
          });
          print("Valeur de compteur : $_compteur");
        },
        child: const Icon(Icons.add),
      ),

    );
  }
}
