import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/balance.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/models/transfers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _appBarTitle = "Criando transferência";

const _labelAccountNumber = "Número da conta";
const _hintAccountNumber = "000";

const _labelValue = "Valor";
const _hintValue = "0.00";

class TransferForm extends StatelessWidget {
  final TextEditingController _ctrlAccountNumber = TextEditingController();
  final TextEditingController _ctrlValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_appBarTitle)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controller: _ctrlAccountNumber,
              icon: Icons.account_balance,
              label: _labelAccountNumber,
              hint: _hintAccountNumber,
            ),
            Editor(
              controller: _ctrlValue,
              icon: Icons.monetization_on,
              label: _labelValue,
              hint: _hintValue,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () => _createTransfer(context),
      ),
    );
  }

  void _createTransfer(BuildContext context) {
    final int accountNumber = int.tryParse(_ctrlAccountNumber.text);
    final double value = double.tryParse(_ctrlValue.text);

    final isValid = _validateTransfer(context, accountNumber, value);

    if (isValid) {
      final Transfer transfer = Transfer(accountNumber, value);

      _updateState(context, transfer);

      Navigator.pop(context);
    }
  }

  bool _validateTransfer(context, accountNumber, value) {
    final _balance = Provider.of<Balance>(context, listen: false).value;

    return accountNumber != null && value != null && _balance >= value;
  }

  void _updateState(context, transfer) {
    Provider.of<Transfers>(context, listen: false).add(transfer);

    Provider.of<Balance>(context, listen: false).remove(transfer.value);
  }
}
