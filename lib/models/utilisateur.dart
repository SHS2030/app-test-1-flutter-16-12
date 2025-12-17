class Utilisateur {
  final int id;
  final String name;
  final String email;
  final Map<String, dynamic> adresse;

  Utilisateur({
    required this.id,
    required this.name,
    required this.email,
    required this.adresse,
  });

  factory Utilisateur.fromJson(Map<String, dynamic> json) {
    return Utilisateur(
      id: json['id'] as int,
      name: json['name'],
      email: json['email'],
      adresse: json['address'],
    );
  }
}
