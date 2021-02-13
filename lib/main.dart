import 'package:bytebank/models/balance.dart';
import 'package:bytebank/screens/dashboard.dart';
import 'package:bytebank/screens/deposit/form.dart';
import 'package:bytebank/screens/transfer/form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (context) => Balance(0),
      child: BytebankApp(),
    ));

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
        "createDeposit": (context) => DepositForm()
      },
    );
  }
}
