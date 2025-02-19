// main.dart

import 'package:dclicpay/gift.dart';
import 'package:dclicpay/home.dart';
import 'package:dclicpay/profil.dart';
import 'package:dclicpay/wallets.dart';
import 'package:flutter/material.dart';

void main() {
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
  @override
  Widget build(BuildContext context) {
    final pages = [MyHome(), Wallets(), Gift(), ProfilPage()];
    int tabIndex = 1;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: MyHomeAppBar()),
        body: pages[tabIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
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
          onTap: (index) {
            setState(() {
              tabIndex = index;
            });
          },
          unselectedItemColor: const Color.fromARGB(221, 128, 127, 127),
          selectedItemColor: Colors.blue,
        ),
      ),
    );
  }
}
