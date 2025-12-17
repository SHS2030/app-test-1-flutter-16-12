import 'package:app_test1/models/utilisateur.dart';
import 'package:app_test1/services/api_services.dart';

class UtilisateurVeiwModel {
  final ApiServices api;

  UtilisateurVeiwModel(this.api);

  List<Utilisateur> utilisateurs = [];

  bool isLoading = false;
  String? erreur = null;

  Future<void> chargerUtilisateurs() async {
    isLoading = true;
    erreur = null;

    try {
      utilisateurs =
          await api.fetchUsers("https://jsonplaceholder.typicode.com/users") ??
          [];
      print("Chargement des utilisateur dans view model");
      for (var utilisateur in utilisateurs) {
        print("${utilisateur.name}");
      }
    } catch (e, stackTrace) {
      erreur = "$e, $stackTrace";
    } finally {
      isLoading = false;
    }
  }
}
