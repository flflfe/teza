import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:teza/model/wallet.dart';
import 'package:teza/res/palette.dart';
import 'package:teza/screens/wallet_info_page.dart';

class GenerateWalletPage extends StatefulWidget {
  @override
  _GenerateWalletPageState createState() => _GenerateWalletPageState();
}

class _GenerateWalletPageState extends State<GenerateWalletPage> {
  InAppWebViewController webView;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, 140),
        child: Container(
          color: Palette.background,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        "Generate a testnet t3 wallet",
                        style: TextStyle(
                          color: Palette.primary,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    "Follow the steps below to download the wallet, once it's done you will be automatically redirected to the next page.",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                      letterSpacing: 0.6,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: InAppWebView(
                initialUrl: 'https://faucet.tzalpha.net/',
                initialHeaders: {},
                initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                    // debuggingEnabled: true,
                    useOnDownloadStart: true,
                  ),
                ),
                onWebViewCreated: (InAppWebViewController controller) {
                  webView = controller;
                },
                onLoadStart: (InAppWebViewController controller, String url) {},
                onLoadStop: (InAppWebViewController controller, String url) {},
                onDownloadStart: (controller, url) async {
                  var rawJson = Uri.decodeFull(url.split(',')[1]);
                  Wallet newWallet = Wallet.fromJson(jsonDecode(rawJson));

                  print(newWallet.amount);

                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => WalletInfoPage(
                        wallet: newWallet,
                      ),
                    ),
                    ModalRoute.withName('/'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
