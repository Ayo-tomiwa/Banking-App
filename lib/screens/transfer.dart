import 'package:bankingapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransferScreen extends StatefulWidget {
  TransferScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final _formKey = GlobalKey<FormState>();
  String _recipient = '';
  String _amount = '';

  void _handleTransfer() async {
    // Implement transfer logic using recipient and amount (API call)
    // Update balance in provider upon successful transfer
    final userData = Provider.of<UserData>(context, listen: false);
    // Update balance based on your API response (replace with actual logic)
    // Consider validations and error handling for insufficient funds, etc.
  }

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center content vertically
            children: [
              CustomTextField(
                labelText: 'Recipient Phone Number',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter recipient phone number.';
                  }
                  // Add validation for phone number format (optional)
                  return null;
                },
                onSaved: (value) => _recipient = value!,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 10.0),
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
                  text: 'Transfer',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _handleTransfer();
                      // Handle successful transfer UI or navigation (optional)
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class UserData {
  get balance => null;

  get transactions => null;

  void setBalance(param0) {}

  void setLogin(bool bool) {}
}
