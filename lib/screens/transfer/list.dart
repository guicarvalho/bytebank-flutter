import 'package:bytebank/components/transfer/item.dart';
import 'package:bytebank/models/transfers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _appBarTitle = "Transferências";

class TransferList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: Consumer<Transfers>(
        builder: (context, transfers, child) {
          return ListView.builder(
            itemCount: transfers.transfers.length,
            itemBuilder: (context, index) {
              final transfer = transfers.transfers[index];

              return TransferItem(transfer);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, "createTransfer"),
        child: Icon(Icons.add),
      ),
    );
  }
}
