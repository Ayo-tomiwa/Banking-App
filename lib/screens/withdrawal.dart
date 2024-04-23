import 'package:bankingapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'transfer.dart';

class WithdrawalScreen extends StatefulWidget {
  @override
  _WithdrawalScreenState createState() => _WithdrawalScreenState();
}

class _WithdrawalScreenState extends State<WithdrawalScreen> {
  final _formKey = GlobalKey<FormState>();
  String _amount = '';

  void _handleWithdrawal() async {
    // Implement withdrawal logic using the amount (API call)
    // Update balance in provider upon successful withdrawal
    final userData = Provider.of<UserData>(context, listen: false);
    // Update balance based on your API response (replace with actual logic)
    userData.setBalance(userData.balance - double.parse(_amount));
  }

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Withdrawal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center content vertically
            children: [
              Text(
                'Available Balance: ₦${userData.balance.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 20.0),
              CustomTextField(
                labelText: 'Amount',
                keyboardType:
                    TextInputType.number, // Set keyboard type for numbers
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an amount.';
                  } else if (double.parse(value) <= 0) {
                    return 'Please enter a valid amount.';
                  } else if (double.parse(value) > userData.balance) {
                    return 'Insufficient funds.';
                  }
                  return null;
                },
                onSaved: (value) => _amount = value!,
              ),
              const SizedBox(height: 20.0),
              CustomButton(
                  text: 'Withdraw',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _handleWithdrawal();
                      Navigator.pop(
                          context); // Go back to Home Screen after successful withdrawal
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
