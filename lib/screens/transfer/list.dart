import 'package:bytebank/components/transfer/item.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

const _appBarTitle = "Transferências";

class TransferList extends StatefulWidget {
  final List<Transfer> _transfers = List();

  @override
  _TransferListState createState() => _TransferListState();
}

class _TransferListState extends State<TransferList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: ListView.builder(
        itemCount: widget._transfers.length,
        itemBuilder: (context, index) {
          final transfer = widget._transfers[index];

          return TransferItem(transfer);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "createTransfer")
              .then((transfer) => _updateTransfers(transfer));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _updateTransfers(transfer) {
    setState(() {
      if (transfer != null) {
        widget._transfers.add(transfer);
      }
    });
  }
}
