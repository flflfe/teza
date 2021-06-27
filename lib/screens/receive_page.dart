import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:teza/res/palette.dart';

class ReceivePage extends StatelessWidget {
  final String str;
  const ReceivePage({@required this.str});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Palette.background,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(),
          QrImage(
            data: str,
            version: QrVersions.auto,
            size: 300.0,
            foregroundColor: Palette.primary,
          ),
          SizedBox(height: 24.0),
          Text(
            str,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
              letterSpacing: 1,
            ),
          ),
          SizedBox(height: 60.0),
        ],
      ),
    );
  }
}
