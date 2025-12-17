import 'package:flutter/material.dart';

class EndDrawerPerso extends StatefulWidget {
  const EndDrawerPerso({super.key});

  @override
  State<EndDrawerPerso> createState() => _EndDrawerPersoState();
}

class _EndDrawerPersoState extends State<EndDrawerPerso> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 120,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: Text('Menu'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Accueil'),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                "/page-accueil",
                (predicate) => false,
              );
            },
          ),
          Divider(color: Theme.of(context).colorScheme.tertiary, thickness: 2),
          ListTile(
            leading: Icon(Icons.countertops_sharp),
            title: Text('Compteur'),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                "/page-compteur",
                (predicate) => false,
              );
            },
          ),
          Divider(color: Theme.of(context).colorScheme.tertiary, thickness: 2),
          ListTile(
            leading: Icon(Icons.store),
            title: Text('Boutique'),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                "/page-boutique",
                (predicate) => false,
              );
            },
          ),
          Divider(color: Theme.of(context).colorScheme.tertiary, thickness: 2),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Paramètres'),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                "/page-parametres",
                (predicate) => false,
              );
            },
          ),
          Divider(color: Theme.of(context).colorScheme.tertiary, thickness: 2),
        ],
      ),
    );
  }
}
