// pages/profil.dart

import 'package:dclicpay/utilisateur/add_utilisateur.dart';
import 'package:dclicpay/utilisateur/connection.dart';
import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfilPage();
  }
}

class _ProfilPage extends State {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        Center(child: Text('Profil Page')),
        Positioned(
          bottom: 40,
          right: 20,
          child: FloatingActionButton(
            child: Icon(Icons.add, color: Colors.blue),

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AjouterUtilisateurPage(),
                ),
              ).then((_) {
                setState(() {}); // Rafraîchir la liste après ajout
              });
            },
          ),
        ),
        FloatingActionButton(
          child: Text(
            'Se deconnecter',
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),

          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignIn()),
            ).then((_) {
              setState(() {}); // Rafraîchir la liste après ajout
            });
          },
        ),
      ],
    );
  }
}
