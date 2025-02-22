// utilisateur/users.dart
// utilisateur/users.dart

import 'package:hive/hive.dart';

part 'users.g.dart';

@HiveType(typeId: 1)
class Utilisateur extends HiveObject {
  @HiveField(0)
  String nom;

  @HiveField(1)
  double solde;

  @HiveField(2)
  String usersProfil;

  @HiveField(3)
  String mail;

  @HiveField(6)
  int compteUsers = DateTime.now().millisecondsSinceEpoch;

  List<double> depenses = [];

  List<double> recettes = [];

  transaction(double montant, bool estdepense) {
    if (estdepense == true) {
      if (solde >= montant) {
        depenses.add(montant);
        solde = solde - montant;
      }
    } else {
      solde = solde + montant;
      recettes.add(montant);
      save();
      return solde;
    }
    save();
  }

  Utilisateur({
    required this.nom,
    required this.solde,
    required this.usersProfil,
    required this.mail,
  });
}

class UtilisateurBase {
  static Box<Utilisateur>? usersBox;

  static Future<void> init() async {
    usersBox = await Hive.openBox<Utilisateur>('utilisateurs');
    if (usersBox!.isEmpty) {
      var utilisateur1 = Utilisateur(
        nom: 'Moïse',
        solde: 1000.0,
        usersProfil: 'assets/Mask Group.png',
        mail: 'moise@gmail.com',
      );
      var utilisateur2 = Utilisateur(
        nom: 'Marie',
        solde: 500.00,
        usersProfil: 'assets/Mask1.png',
        mail: 'marie@gmail.com',
      );
      await usersBox!.put(utilisateur1.mail, utilisateur1);
      await usersBox!.put(utilisateur2.mail, utilisateur2);
    }
  }

  static Utilisateur? getUtilisateur(String email) {
    return usersBox?.get(email);
  }

  static Utilisateur? getUtilisateurNom(String nom) {
    return usersBox?.get(nom);
  }

  static List<Utilisateur> getTousLesUtilisateurs() {
    return usersBox?.values.toList() ?? [];
  }
}
