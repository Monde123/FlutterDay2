// sendpage.dart

import 'package:flutter/material.dart';

class SendMoneyPage extends StatefulWidget {
  const SendMoneyPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SendMoneyPage();
  }
}

class _SendMoneyPage extends State {
  int selectedIndex = 0;
  double montant = 25.00;
  final cardIcone = [
    'assets/visa-logo.png',
    ' assets/amex(7).png',
    'assets/Group 41.png',
  ];
  final nomIcone = ['Virtual id card', 'Physical Id card', 'Physical Id card'];
  @override
  Widget build(BuildContext context) {
    double largeurEcran = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: /* Container(
        height: hauteurEcran*0.8,
        padding: EdgeInsets.only(right: 20, left: 20, bottom: 20),
        color: const Color.fromARGB(255, 231, 228, 228),
        child:*/ Column(
        spacing: 10,
        children: [
          Container(
            padding: EdgeInsets.only(right: 20, left: 20, bottom: 20),

            child: Column(
              spacing: 15,
              children: [
                SizedBox(
                  height: 65,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [
                      Container(
                        height: 4,
                        width: 50,

                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 145, 142, 140),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      Text(
                        'Send money',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Select card',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                  width: largeurEcran,
                  child: ListView.builder(
                    itemCount: cardIcone.length,

                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var icone = cardIcone[index];
                      var iconeName = nomIcone[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: SizedBox(
                          height: 45,
                          width: largeurEcran * 0.4,
                          child: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Container(
                              height: 40,
                              width: largeurEcran * 0.4 - 20,
                              decoration: BoxDecoration(
                                color:
                                    selectedIndex == index
                                        ? Colors.blue
                                        : Colors.white,

                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 10,
                                children: [
                                  Image.asset(icone),
                                  Text(
                                    iconeName,

                                    style: TextStyle(
                                      color:
                                          selectedIndex == index
                                              ? Colors.white
                                              : const Color.fromARGB(
                                                221,
                                                38,
                                                37,
                                                37,
                                              ),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                      //  ],
                      //   );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Choose recipient',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),

                TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 5),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    hintText: 'Type name/card',
                    suffixIcon: Image.asset('assets/Security Safe.png'),
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/Mask1.png'),
                      Image.asset('assets/Mask1.png'),
                      Image.asset('assets/Mask1.png'),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Amount',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Column(
                    spacing: 20,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '\$'
                        '$montant',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 30,
                        children: [
                          GestureDetector(
                            onTap: () {
                              montant >= 0.5
                                  ? setState(() {
                                    montant = montant - 0.5;
                                  })
                                  : Text(
                                    '$montant',
                                    style: TextStyle(color: Colors.red),
                                  );
                            },
                            child: Icon(
                              Icons.remove_circle_outline,
                              color: Colors.red,
                              size: 30,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                montant = montant + 0.5;
                              });
                            },
                            child: Icon(
                              Icons.add_circle_outline,
                              color: Colors.green,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Icon(Icons.check_box_rounded),
                    Text(
                      '''Agree with ideate's terms and conditions''',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  child: Container(
                    height: 50,
                    width: largeurEcran - 40,

                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Center(
                      child: Text(
                        'Send money',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // ),
          ),
        ],
      ),
    );
  }
}
