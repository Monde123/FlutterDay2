// utilisateur/users.dart
// utilisateur/users.dart

import 'package:hive/hive.dart';

part 'users.g.dart';

@HiveType(typeId: 0)
class Transaction extends HiveObject {
  Transaction({required this.amount, required this.estDepense});
  @HiveField(0)
  double amount;
  @HiveField(1)
  bool estDepense;
}

@HiveType(typeId: 1)
class Utilisateur extends HiveObject {
  @HiveField(0)
  String nom;

  @HiveField(1)
  double solde;

  @HiveField(2)
  bool estHomme;

  @HiveField(3)
  String mail;

  int compteUsers = DateTime.now().millisecondsSinceEpoch;

  @HiveField(4)
  HiveList<Transaction>? transactions;

  late String usersProfil;

  void ajouterTransaction(Transaction transaction) async {
    transactions!.add(transaction);
    if (transaction.estDepense) {
      solde -= transaction.amount;
    } else {
      solde += transaction.amount;
    }
    save();
  }

  Utilisateur({
    required this.nom,
    required this.solde,
    required this.estHomme,
    required this.mail,
  }) {
    if (estHomme != true) {
      usersProfil = 'assets/Mask1.png';
    } else {
      usersProfil = 'assets/Mask Group.png';
    }
  }
}

class UtilisateurBase {
  static Box<Utilisateur>? usersBox;

  static Future<void> init() async {
    usersBox = await Hive.openBox<Utilisateur>('utilisateurs');
    if (usersBox!.isEmpty) {
      var utilisateur1 = Utilisateur(
        nom: 'Moïse',
        solde: 1000.0,
        estHomme: true,
        mail: 'moise@gmail.com',
      );
      var utilisateur2 = Utilisateur(
        nom: 'Marie',
        solde: 500.00,
        estHomme: false,
        mail: 'marie@gmail.com',
      );
      await usersBox!.put(utilisateur1.mail, utilisateur1);
      var transaction = Transaction(amount: 0, estDepense: false);
      utilisateur1.ajouterTransaction(transaction);
      await usersBox!.put(utilisateur2.mail, utilisateur2);
      utilisateur2.ajouterTransaction(transaction);
    }
  }

  static Utilisateur? getUtilisateur(String email) {
    return usersBox?.get(email);
  }

  static List<Utilisateur> getTousLesUtilisateurs() {
    return usersBox?.values.toList() ?? [];
  }
}
