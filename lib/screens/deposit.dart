import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bankingapp/screens/transfer.dart';
import 'package:bankingapp/widgets/widgets.dart'; 

class DepositScreen extends StatefulWidget {
  @override
  _DepositScreenState createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  final _formKey = GlobalKey<FormState>();
  String _amount = '';

  void _handleDeposit() {
    final userData = Provider.of<UserData>(context, listen: false);

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Update balance in provider
      userData.setBalance(userData.balance + double.parse(_amount));

      // Navigate back to HomeScreen after successful deposit
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deposit'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  labelText: 'Amount',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an amount.';
                    } else if (double.tryParse(value) == null || double.parse(value) <= 0) {
                      return 'Please enter a valid amount.';
                    }
                    return null;
                  },
                  onSaved: (value) => _amount = value!,
                ),
                const SizedBox(height: 20.0),
                CustomButton(
                  text: 'Deposit',
                  onPressed: _handleDeposit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
