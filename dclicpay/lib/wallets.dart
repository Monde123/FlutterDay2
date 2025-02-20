// wallets.dart
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:u_credit_card/u_credit_card.dart';

class Wallets extends StatefulWidget {
  const Wallets({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Wallets();
  }
}

class _Wallets extends State {
  @override
  Widget build(BuildContext context) {
    double largeurEcran = MediaQuery.of(context).size.width;
    double hauteurEcran = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        spacing: 15,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  height: hauteurEcran*0.3,
                  child: CreditCardUi(
                    cardHolderFullName: 'John Doe',
                    cardNumber: '1234567812345678',
                    validFrom: '01/23',
                    validThru: '01/28',
                    topLeftColor: Colors.blue,
                    doesSupportNfc: true,
                    placeNfcIconAtTheEnd: true,
                    cardType: CardType.other,
                    cardProviderLogo: FlutterLogo(),
                    cardProviderLogoPosition: CardProviderLogoPosition.left,
                    showBalance: true,
                    balance: 128.32434343,
                    autoHideBalance: true,
                    enableFlipping: true,
                    cvvNumber: '123',
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              'Total Spending',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ),

          NavigationBar(
            destinations: [
              Text('Day', style: TextStyle(fontSize: 16)),
              Text('Week', style: TextStyle(fontSize: 16)),
              Text('Month', style: TextStyle(fontSize: 16)),
              Text('Year', style: TextStyle(fontSize: 16)),
            ],
            indicatorColor: Colors.black,
            shadowColor: const Color.fromARGB(255, 230, 225, 225),
          ),
        ],
      ),
    );
  }
}
