import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:teza/model/wallet.dart';
import 'package:teza/res/palette.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Wallet _wallet;
  String _amountString;

  @override
  void initState() {
    super.initState();

    final walletBox = Hive.box<Wallet>('wallet');
    _wallet = walletBox.get(0);

    _amountString = (double.parse(_wallet.amount) / 1000000).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Palette.background,
      ),
      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 8.0,
          left: 16.0,
          right: 16.0,
        ),
        child: Column(
          children: [
            Row(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'amount',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  _amountString,
                  style: TextStyle(
                    color: Palette.primary,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    fontSize: 50.0,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
