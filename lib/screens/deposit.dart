import 'package:bankingapp/screens/transfer.dart';
import 'package:bankingapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DepositScreen extends StatefulWidget {
  @override
  _DepositScreenState createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  final _formKey = GlobalKey<FormState>();
  String _amount = '';

  void _handleDeposit() async {
    // Implement deposit logic using the amount (API call)
    // Update balance in provider upon successful deposit
    final userData = Provider.of<UserData>(context, listen: false);
    // Update balance based on your API response (replace with actual logic)
    userData.setBalance(userData.balance + double.parse(_amount));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deposit'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center content vertically
            children: [
              CustomTextField(
                labelText: 'Amount',
                keyboardType:
                    TextInputType.number, // Set keyboard type for numbers
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an amount.';
                  } else if (double.parse(value) <= 0) {
                    return 'Please enter a valid amount.';
                  }
                  return null;
                },
                onSaved: (value) => _amount = value!,
              ),
              SizedBox(height: 20.0),
              CustomButton(
                  text: 'Deposit',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _handleDeposit();
                      Navigator.pop(
                          context); // Go back to Home Screen after successful deposit
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
