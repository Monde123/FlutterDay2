// utilisateur/connection.dart

import 'package:dclicpay/main.dart';

import 'package:dclicpay/utilisateur/inscription.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../utilisateur/users.dart';

String signUser = '';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignInState();
  }
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController();
  void connexion() async {
    final usersBox = await Hive.openBox<Utilisateur>('utilisateurs');
    if (usersBox.containsKey(emailController.text)) {
      signUser = emailController.text;
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyAppHome()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double largeurEcran = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Page de connexion',
          style: TextStyle(color: Colors.green, fontSize: 16),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
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
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Entrez votre adresse mail',
              ),
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !value.contains('@gmail.com')) {
                  return "Entrez un mail valide";
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Premier pas?',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: Text(
                    'Inscrivez-vous',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            ElevatedButton(onPressed: connexion, child: Text("Se connecter")),
          ],
        ),
      ),
    );
  }
}
