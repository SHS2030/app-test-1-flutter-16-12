import 'dart:convert';

import 'package:app_test1/models/utilisateur.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  // Singleton
  static final ApiServices _apiServices = ApiServices._internal();
  factory ApiServices() => _apiServices;
  ApiServices._internal();

  Future<List<Utilisateur>?> fetchUsers(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var sortie = json.decode(response.body);
        //debugPrint("${jsonEncode(sortie)}");
        final List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(
          sortie,
        );
        //return data.map((json) => Utilisateur.fromJson(json)).toList();
        List<Utilisateur> utilisateurs = [];
        print("Création de la liste des utilisateurs");
        for (var utilisateur in data) {
          utilisateurs.add(Utilisateur.fromJson(utilisateur));
          print("${utilisateur["name"]} ajouté avec succes dans la liste");
        }
        return utilisateurs;
      } else {
        throw Exception(
          "Une erreur s'est produite. Code : ${response.statusCode}, Raison : ${response.reasonPhrase}",
        );
      }
    } catch (e, stackTrace) {
      debugPrint("$e, $stackTrace");
    }
    return null;
  }
}
