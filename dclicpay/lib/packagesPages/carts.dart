// carts.dart
import 'package:flutter/material.dart';
import 'package:u_credit_card/u_credit_card.dart';

class Cards extends StatelessWidget {
  const Cards({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 20,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            child: CreditCardUi(
              width: 300,
              cardHolderFullName: 'John Doe',
              cardNumber: '1234567812345678',
              validFrom: '01/23',
              validThru: '01/28',
              topLeftColor: Colors.blue,
              doesSupportNfc: true,
              placeNfcIconAtTheEnd: true,
              cardType: CardType.credit,
              cardProviderLogo: FlutterLogo(),
              cardProviderLogoPosition: CardProviderLogoPosition.left,
              showBalance: true,
              balance: 128.32434343,
              autoHideBalance: true,
              enableFlipping: false,
              cvvNumber: '123',
            ),
          ),
          Container(
            child: CreditCardUi(
              width: 300,
              cardHolderFullName: 'John Doe',
              cardNumber: '1234567812345678',
              validFrom: '01/23',
              validThru: '01/28',
              topLeftColor: Colors.green,
              doesSupportNfc: true,
              placeNfcIconAtTheEnd: true,
              cardType: CardType.credit,
              cardProviderLogo: FlutterLogo(),
              cardProviderLogoPosition: CardProviderLogoPosition.left,
              showBalance: true,
              balance: 128.32434343,
              autoHideBalance: true,
              enableFlipping: false,
              cvvNumber: '123',
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 20),
            child: CreditCardUi(
              width: 300,
              cardHolderFullName: 'John Doe',
              cardNumber: '1234567812345678',
              validFrom: '01/23',
              validThru: '01/28',
              topLeftColor: Colors.black,
              doesSupportNfc: true,
              placeNfcIconAtTheEnd: true,
              cardType: CardType.credit,
              cardProviderLogo: FlutterLogo(),
              cardProviderLogoPosition: CardProviderLogoPosition.left,
              showBalance: true,
              balance: 128.32434343,
              autoHideBalance: true,
              enableFlipping: false,
              cvvNumber: '123',
            ),
          ),
        ],
      ),
    );
  }
}
