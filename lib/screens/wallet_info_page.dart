import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:teza/model/wallet.dart';
import 'package:teza/res/palette.dart';

class WalletInfoPage extends StatefulWidget {
  final Wallet wallet;

  const WalletInfoPage({@required this.wallet});

  @override
  _WalletInfoPageState createState() => _WalletInfoPageState();
}

class _WalletInfoPageState extends State<WalletInfoPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Palette.background,
      statusBarIconBrightness: Brightness.light,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 32.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(),
            ],
          ),
        ),
      ),
    );
  }
}
