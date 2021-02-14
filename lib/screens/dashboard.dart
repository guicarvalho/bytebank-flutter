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
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.purple[800],
                child: Text("Receber depósito"),
                onPressed: () => Navigator.pushNamed(context, "createDeposit"),
              ),
              RaisedButton(
                color: Colors.purple[800],
                child: Text("Nova transferência"),
                onPressed: () => Navigator.pushNamed(context, "createTransfer"),
              ),
            ],
          ),
          RaisedButton(
            color: Colors.purple[800],
            textColor: Colors.white,
            child: Text("Transferências"),
            onPressed: () => Navigator.pushNamed(context, "transferList"),
          )
        ],
      ),
    );
  }
}
