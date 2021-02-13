import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/balance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _appBarTitle = "Recebendo depósito";

const _labelValue = "Valor";
const _hintValue = "0.00";

class DepositForm extends StatelessWidget {
  final TextEditingController _ctrlValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
        onPressed: () => _createDeposit(context),
      ),
    );
  }

  void _createDeposit(BuildContext context) {
    final double value = double.tryParse(_ctrlValue.text);
    final bool validDeposit = _validateDeposit(value);

    if (validDeposit) {
      updateState(context, value);

      Navigator.pop(context);
    }
  }

  bool _validateDeposit(value) {
    return value != null;
  }

  void updateState(context, value) {
    Provider.of<Balance>(context, listen: false).add(value);
  }
}
