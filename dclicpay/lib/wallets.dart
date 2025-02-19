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
    return /*Padding(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child:*/ Column(
      children: [
        SizedBox(
          height: largeurEcran * 0.4 - 20,
          width: largeurEcran - 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: largeurEcran * 0.4 - 20,
                width: largeurEcran * 0.5 - 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: CreditCardUi(
                  width: largeurEcran * 0.5 - 45,
                  cardHolderFullName: 'John Doe',
                  cardNumber: '1234567812345678',
                  validFrom: '01/23',
                  validThru: '01/28',
                  topLeftColor: Colors.blue,
                  doesSupportNfc: true,
                  placeNfcIconAtTheEnd: true,
                  cardType: CardType.debit,
                  cardProviderLogo: FlutterLogo(),
                  cardProviderLogoPosition: CardProviderLogoPosition.right,
                  showBalance: true,
                  balance: 128.32434343,
                  autoHideBalance: true,
                  enableFlipping: true,
                  cvvNumber: '123',
                ),
              ),
              Container(
                height: largeurEcran * 0.4 - 20,
                width: largeurEcran * 0.5 - 45,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
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

        SizedBox(
          height: hauteurEcran * 0.5,
          child: CreditCardUi(
            cardHolderFullName: 'John Doe',
            cardNumber: '1234567812345678',
            validFrom: '01/23',
            validThru: '01/28',
            topLeftColor: Colors.blue,
            doesSupportNfc: true,
            placeNfcIconAtTheEnd: true,
            cardType: CardType.debit,
            cardProviderLogo: FlutterLogo(),
            cardProviderLogoPosition: CardProviderLogoPosition.right,
            showBalance: true,
            balance: 128.32434343,
            autoHideBalance: true,
            enableFlipping: true, // 👈 Enables the flipping
            cvvNumber:
                '123', // 👈 CVV number to be shown on the back of the card
          ),
        ),
      ],
    );
    /*   ),
    );*/
  }
}
