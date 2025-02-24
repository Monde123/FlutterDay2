// utilisateur/add_utilisateur.dart
import 'dart:math';

import 'package:dclicpay/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:dclicpay/utilisateur/users.dart';

class AjouterUtilisateurPage extends StatefulWidget {
  const AjouterUtilisateurPage({super.key});

  @override
  _AjouterUtilisateurPageState createState() => _AjouterUtilisateurPageState();
}

class _AjouterUtilisateurPageState extends State<AjouterUtilisateurPage> {
  final _formKey = GlobalKey<FormState>();
  String nom = "";
  String email = "";
  double solde = 0.0;
  bool profil = Random().nextBool();

  @override
  Widget build(BuildContext context) {
    double largeurEcran = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text("Ajout d'utilisateur")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: largeurEcran,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/dclic.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Nom"),
                onChanged: (val) => nom = val,
                validator: (val) => val!.isEmpty ? "Entrez un nom" : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                onChanged: (val) => email = val,
                validator: (val) => val!.isEmpty ? "Entrez un email" : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Solde"),
                keyboardType: TextInputType.number,
                onChanged: (val) => solde = double.tryParse(val) ?? 0.0,
              ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    var newUser = Utilisateur(
                      nom: nom,
                      solde: solde,
                      estHomme: profil,
                      mail: email,
                    );

                    await UtilisateurBase.usersBox!.put(newUser.mail, newUser);
                    listeUtilisateurs.add(newUser);
                    var transaction = Transaction(amount: 0, estDepense: false);
                    newUser.ajouterTransaction(transaction);

                    Navigator.pop(context); // Fermer le formulaire
                  }
                },
                child: Text("Ajouter"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
