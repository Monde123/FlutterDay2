// utilisateur/inscription.dart
import 'package:dclicpay/pages/home.dart';
import 'package:dclicpay/utilisateur/connection.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../utilisateur/users.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignUpPageState();
  }
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _soldeController = TextEditingController();
  bool _estHomme = true;

  void _inscrireUtilisateur() async {
    if (_formKey.currentState!.validate()) {
      final usersBox = await Hive.openBox<Utilisateur>('utilisateurs');
      final transactionBox = await Hive.openBox<Transaction>('transactions');
      if (usersBox.containsKey(_emailController.text)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Email déjà utilisé. Veuillez vous connecter !'),
          ),
        );
        return;
      }

      // Création du nouvel utilisateur
      final nouvelUtilisateur = Utilisateur(
        nom: _nomController.text,
        solde: double.tryParse(_soldeController.text) ?? 0.0,
        estHomme: _estHomme,
        mail: _emailController.text,
      );

      // Enregistrement dans Hive
      await usersBox.put(nouvelUtilisateur.mail, nouvelUtilisateur);
      listeUtilisateurs.add(nouvelUtilisateur);
      var transaction = Transaction(amount: 0.0, estDepense: false);
      nouvelUtilisateur.ajouterTransaction(transaction, transactionBox);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Inscription réussie ! Connectez-vous maintenant.'),
        ),
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignIn()),
      ); // Retour à la page précédente
    }
  }

  @override
  Widget build(BuildContext context) {
    double largeurEcran = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text("Inscription")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: largeurEcran,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/dclic.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              TextFormField(
                controller: _nomController,
                decoration: InputDecoration(labelText: "Nom"),
                validator: (value) {
                  value?.trim();
                  if (value == null || value.isEmpty) {
                    return "Entrez votre nom";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !value.contains('@gmail.com')) {
                    return "Entrez un email valide";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _soldeController,
                decoration: InputDecoration(labelText: "Solde initial"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Entrez un solde initial";
                  }
                  if (double.tryParse(value) == null) {
                    return "Entrez un montant valide";
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Text("Genre : "),
                  Radio(
                    value: true,
                    groupValue: _estHomme,
                    onChanged: (value) {
                      setState(() {
                        _estHomme = value as bool;
                      });
                    },
                  ),
                  Text("H"),
                  Radio(
                    value: false,
                    groupValue: _estHomme,
                    onChanged: (value) {
                      setState(() {
                        _estHomme = value as bool;
                      });
                    },
                  ),
                  Text("F"),
                ],
              ),
              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
                  Text(
                    'Deja inscrit ?',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignIn()),
                      );
                    },
                    child: Text(
                      'Connectez-vous',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _inscrireUtilisateur,
                  child: Text("S'inscrire"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
