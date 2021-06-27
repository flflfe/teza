import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teza/model/wallet.dart';
import 'package:teza/screens/dashboard_page.dart';

import 'screens/initial_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  Hive.registerAdapter(WalletAdapter());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isAvailable;

  getPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isAvailable = prefs.getBool('isAvailable');
    });
  }

  @override
  void initState() {
    getPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teza',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Montserrat',
      ),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
          future: Hive.openBox<Wallet>('wallet'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              print('IS AVAILABLE: $isAvailable');
              if (isAvailable != null && isAvailable) {
                return DashboardPage();
              } else {
                return InitialPage();
              }
            }
            return Container();
          }),
    );
  }
}
