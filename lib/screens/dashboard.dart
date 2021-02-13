import 'package:bytebank/components/balance_card.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bytebank"),
      ),
      body: ListView(
        children: <Widget>[
          Align(
            child: BalanceCard(),
            alignment: Alignment.topCenter,
          ),
          RaisedButton(
            child: Text("Receber depósito"),
            onPressed: () => Navigator.pushNamed(context, "createDeposit"),
          ),
        ],
      ),
    );
  }
}
