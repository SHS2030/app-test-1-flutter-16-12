import 'dart:convert';

import 'package:app_test1/components/end_drawer_perso.dart';
import 'package:app_test1/services/api_services.dart';
import 'package:app_test1/view_models/utilisateur_veiw_model.dart';
import 'package:flutter/material.dart';

class PageAccueil extends StatefulWidget {
  const PageAccueil({super.key});

  @override
  State<PageAccueil> createState() => _PageAccueilState();
}

class _PageAccueilState extends State<PageAccueil> {
  final UtilisateurVeiwModel viewModel = UtilisateurVeiwModel(ApiServices());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _chargerUtilisateurs();
  }

  Future<void> _chargerUtilisateurs() async {
    print("Chargement des utilisateur pour l'affichage ACCUEIL ++++++++++++++++++++++++");
    await viewModel.chargerUtilisateurs();
    for (var utilisateur in viewModel.utilisateurs) {
      print("${utilisateur.name} chargé");
    }
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: EndDrawerPerso(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        title: const Text("Page Accueil"),
      ),
      body: Center(
        child: (viewModel.isLoading)
            ? (CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
                strokeWidth: 5,
              ))
            : ((viewModel.erreur == null)
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.all(5),
                      child: (ListView.separated(
                        itemBuilder: (context, index) {
                          return Hero(
                            tag: viewModel.utilisateurs[index].id,
                            child: ListTile(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  "/page-details-profil",
                                  arguments: {
                                    "id": viewModel.utilisateurs[index].id,
                                    "name": viewModel.utilisateurs[index].name,
                                    "email":
                                        viewModel.utilisateurs[index].email,
                                    "urlImage":
                                        "https://i.pravatar.cc/150?img=${viewModel.utilisateurs[index].id}",
                                  },
                                );
                              },
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  "https://i.pravatar.cc/150?img=${viewModel.utilisateurs[index].id}",
                                ),
                                radius: 50,
                              ),
                              title: Text(viewModel.utilisateurs[index].name),
                              subtitle: Text(
                                viewModel.utilisateurs[index].email,
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            thickness: 2,
                            color: Theme.of(context).colorScheme.primary,
                          );
                        },
                        itemCount: viewModel.utilisateurs.length,
                      )),
                    )
                  : (const Text("Aucun resultat à afficher"))),
      ),
    );
  }
}
