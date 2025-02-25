// main.dart

import 'package:dclicpay/boxes.dart';
import 'package:dclicpay/pages/gift.dart';
import 'package:dclicpay/pages/home.dart';
import 'package:dclicpay/pages/profil.dart';
import 'package:dclicpay/pages/wallets.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'utilisateur/users.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  Hive.registerAdapter(UtilisateurAdapter());
  Hive.registerAdapter(TransactionAdapter());
  await UtilisateurBase.init();
  
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  int tabIndex = 0;
  final pages = [MyHome(), Wallets(), Gift(), ProfilPage()];

  void onItemTapped(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  final appBarListe = [
    MyHomeAppBar(),
    WalletsAppBar(),
    MyHomeAppBar(),
    MyHomeAppBar(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: appBarListe[tabIndex]),
        body: pages[tabIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet_outlined),
              label: 'wallet',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard_sharp),
              label: 'gift',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'profil',
            ),
          ],

          currentIndex: tabIndex,

          unselectedItemColor: const Color.fromARGB(221, 128, 127, 127),
          selectedItemColor: Colors.blue,

          onTap: onItemTapped,
        ),
      ),
    );
  }
}
