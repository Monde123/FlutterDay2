// packagesPages/carts.dart
import 'package:dclicpay/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:u_credit_card/u_credit_card.dart';

class Cards extends StatelessWidget {
  const Cards({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child:
          user1 != null
              ? Container(
                padding: EdgeInsets.only(left: 20),
                child: CreditCardUi(
                  width: 300,
                  cardHolderFullName: user1!.nom,
                  cardNumber: '${user1?.compteUsers}',
                  validFrom: '01/23',
                  validThru: '01/28',
                  topLeftColor: Colors.blue,
                  doesSupportNfc: true,
                  placeNfcIconAtTheEnd: true,
                  cardType: CardType.credit,
                  cardProviderLogo: Image.asset('assets/dclic.png'),
                  cardProviderLogoPosition: CardProviderLogoPosition.left,
                  showBalance: true,
                  balance: user1?.solde,
                  autoHideBalance: true,
                  enableFlipping: false,
                  cvvNumber: '123',
                ),
              )
              : CreditCardUi(
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
    );
  }
}
