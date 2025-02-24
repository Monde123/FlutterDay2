// pages/profil.dart
import 'package:dclicpay/utilisateur/add_utilisateur.dart';
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
      ],
    );
  }
}
