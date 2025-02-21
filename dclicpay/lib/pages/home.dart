// pages/home.dart
import 'package:dclicpay/pages/sendpage.dart';
import 'package:flutter/material.dart';
import 'package:dclicpay/utilisateur/users.dart';

var user1 = UtilisateurDB.getUtilisateur('moise@gmail.com');
var listeUtilisateurs = UtilisateurDB.getTousLesUtilisateurs();

class MyHomeAppBar extends StatelessWidget {
  const MyHomeAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 200,
          child: Row(
            spacing: 10,
            children: [
              CircleAvatar(
                radius: 24,

                backgroundImage: AssetImage(user1!.usersProfil),
              ),

              Text(
                'Hello'
                '${user1?.mail}'
                '!',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ],
          ),
        ),

        CircleAvatar(
          radius: 22,
          backgroundColor: Colors.blue[50],
          child: Icon(Icons.search),
        ),
      ],
    );
  }
}
// Body du homepage

class MyHome extends StatefulWidget {
  const MyHome({super.key});
  @override
  State<StatefulWidget> createState() {
    return _MyHome();
  }
}

class _MyHome extends State {
  _MyHome();
  @override
  Widget build(BuildContext context) {
    double largeurEcran = MediaQuery.of(context).size.width;
    double hauteurEcran = MediaQuery.of(context).size.height;
    var listeUtilisateur = SizedBox(
      height: hauteurEcran * 0.4,
      child: ListView.builder(
        itemCount: listeUtilisateurs.length,
        itemBuilder: (context, index) {
          var user = listeUtilisateurs[index];
          return SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 200,
                  child: Row(
                    spacing: 5,
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundImage: AssetImage(user.usersProfil),
                      ),
                      SizedBox(
                        height: 50,

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              user.nom,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '22 jan 2025',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '+'
                        '\$'
                        '${user.solde}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,

                          color: Colors.green,
                        ),
                      ),
                      Text(
                        '22 h 45',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
    var row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Recently activities',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(
          width: 45,

          child: Row(
            children: [Text('All'), Icon(Icons.arrow_drop_down_outlined)],
          ),
        ),
      ],
    );
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          spacing: 10,
          children: [
            Container(
              height: hauteurEcran * 0.2,
              width: largeurEcran - 40,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${user1!.nom}'
                            'acount',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            'Added card:05',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 75,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '\$'
                            '${user1!.solde}',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Total balance',
                            style: TextStyle(
                              fontSize: 12,
                              color: const Color.fromARGB(255, 231, 210, 210),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Added card:05',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            'Added card:05',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Features',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text('See more'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: const Color.fromARGB(255, 202, 200, 200),
                      builder: (context) {
                        return SendMoneyPage();
                      },
                    );
                  },
                  child: Container(
                    width: largeurEcran * 0.25,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 233, 233, 234),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 5,
                      children: [
                        Image.asset('assets/money-send.png'),
                        Text(
                          'Send',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: largeurEcran * 0.25 + 5,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 233, 233, 234),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 5,
                    children: [
                      Image.asset('assets/money-recive.png'),
                      Text(
                        'Receive',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  //  ),
                ),

                Container(
                  width: largeurEcran * 0.25,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 233, 233, 234),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 5,
                    children: [
                      Image.asset('assets/Group 6.png'),
                      Text(
                        'Rewards',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            row,
            listeUtilisateur,
          ],
        ),
      ),
    );
  }
}
