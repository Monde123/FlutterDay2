// sendpage.dart

import 'package:flutter/material.dart';

class SendPage extends StatelessWidget {
  const SendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SendMoneyPage());
  }
}

class SendMoneyPage extends StatefulWidget {
  const SendMoneyPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SendMoneyPage();
  }
}

class _SendMoneyPage extends State {
  @override
  Widget build(BuildContext context) {
    double largeurEcran = MediaQuery.of(context).size.width;
    double hauteurEcran = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            height: hauteurEcran * 0.2,
            width: largeurEcran,
            color: const Color.fromARGB(255, 245, 251, 251),
            child: Column(
              children: [
                SizedBox(
                  height: 60,
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
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 20),
                    Text(
                      'Select card',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),

                ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      height: 20,
                      width: largeurEcran * 0.3,
                      color: Colors.amber,
                    ),
                    Container(
                      height: 20,
                      width: largeurEcran * 0.3,
                      color: Colors.amber,
                    ),
                    Container(
                      height: 20,
                      width: largeurEcran * 0.3,
                      color: Colors.amber,
                    ),
                  ],
                ),
                //  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
