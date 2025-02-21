// pages/wallets.dart
import 'package:dclicpay/packagesPages/carts.dart';
import 'package:flutter/material.dart';
import '../packagesPages/chart.dart';

class WalletsAppBar extends StatelessWidget {
  const WalletsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 40),
        Text(
          'Wallets',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        CircleAvatar(
          radius: 22,
          backgroundColor: Colors.blue[50],
          child: Icon(Icons.add),
        ),
      ],
    );
  }
}

class Wallets extends StatefulWidget {
  const Wallets({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Wallets();
  }
}

class _Wallets extends State<Wallets> {
  @override
  Widget build(BuildContext context) {
   
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(padding: EdgeInsets.only(right: 20), child: Cards()),

          ListTile(
            title: Text(
              'Total Spending',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ),
          DefaultTabController(
            length: 4,
            child: TabBar(
              labelColor: Colors.blue,
              unselectedLabelColor: const Color.fromARGB(255, 151, 144, 144),
              tabs: [
                Tab(child: Text('Day', style: TextStyle(fontSize: 12))),
                Tab(child: Text('Week', style: TextStyle(fontSize: 12))),
                Tab(child: Text('Month', style: TextStyle(fontSize: 12))),
                Tab(
                  child: Text('Custom range', style: TextStyle(fontSize: 10)),
                ),
              ],
            ),
          ),

          LineChartSample2(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  spacing: 8,
                  children: [
                    Text(
                      'Weekly spend',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '\$'
                      '2.9860',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  spacing: 8,
                  children: [
                    Text(
                      'Shopping',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '\$'
                      '2.85',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 20),
                child: Column(
                  spacing: 8,
                  children: [
                    Text(
                      'Others',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '\$'
                      '2.85',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  spacing: 8,
                  children: [
                    Text(
                      'Weekly income',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '\$'
                      '2.85',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  'See details',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
