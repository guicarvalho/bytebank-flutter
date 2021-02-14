import 'package:bytebank/models/balance.dart';
import 'package:bytebank/screens/dashboard.dart';
import 'package:bytebank/screens/deposit/form.dart';
import 'package:bytebank/screens/transfer/form.dart';
import 'package:bytebank/screens/transfer/list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/transfers.dart';

void main() => runApp(
      MultiProvider(
        child: BytebankApp(),
        providers: [
          ChangeNotifierProvider(
            create: (context) => Balance(0),
          ),
          ChangeNotifierProvider(
            create: (context) => Transfers(),
          ),
        ],
      ),
    );

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purple[800],
        accentColor: Colors.tealAccent[400],
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => Dashboard(),
        "createTransfer": (context) => TransferForm(),
        "transferList": (context) => TransferList(),
        "createDeposit": (context) => DepositForm()
      },
    );
  }
}
