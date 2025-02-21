// utilisateur/users.dart
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'dart:io';

part 'users.g.dart'; //

@HiveType(typeId: 1)
class Utilisateur extends HiveObject {
  Utilisateur(this.nom, this.solde, this.usersProfil, this.mail);

  //propriétes
  @HiveField(0)
  String nom;

  @HiveField(1)
  double solde;

  @HiveField(2)
  String usersProfil;

  @HiveField(3)
  String mail;

  // Méthodes
  void recevoir(double montant) {
    solde += montant;
    save();
  }

  void envoyer(double montant) {
    solde >= montant ? solde -= montant : Text('Solde insufisant');
    save();
  }
}

class UtilisateurDB {
  static late Box<Utilisateur> usersBox;

  static Future<void> init() async {
    var path = Directory.current.path;
    Hive
      ..init(path)
      ..registerAdapter(UtilisateurAdapter());

    usersBox = await Hive.openBox<Utilisateur>('utilisateurs');
  }

  //ajout d'utilisateur
  static Future<void> ajouterUtilisateur(Utilisateur user) async {
    await usersBox.put(user.mail, user);
  }

  // Récupérer un utilisateur par son email
  static Utilisateur? getUtilisateur(String email) {
    return usersBox.get(email);
  }

  // Récupérer tous les utilisateurs
  static List<Utilisateur> getTousLesUtilisateurs() {
    return usersBox.values.toList();
  }
}

void main() async {
  await UtilisateurDB.init();

  var utilisateur1 = Utilisateur(
    'Moïse',
    1000.0,
    'Mask Group.png',
    'moise@gmail.com',
  );
  await UtilisateurDB.ajouterUtilisateur(utilisateur1);
  var utilisateur2 = Utilisateur(
    'Marie',
    500.00,
    'Mask1.png',
    'marie@gmail.com',
  );
  await UtilisateurDB.ajouterUtilisateur(utilisateur2);
}
