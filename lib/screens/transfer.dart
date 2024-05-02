import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({Key? key}) : super(key: key);

  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final _formKey = GlobalKey<FormState>();
  String _recipient = '';
  String _amount = '';

  void _handleTransfer() {
    final userData = Provider.of<UserData>(context, listen: false);

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Simulate transfer logic (deduct amount from balance)
      double transferAmount = double.parse(_amount);
      if (transferAmount <= userData.balance) {
        userData.setBalance(userData.balance - transferAmount);

        // Add transaction to user's transaction history
        Transaction transaction = Transaction(
          type: TransactionType.Transfer,
          amount: transferAmount,
          recipient: _recipient,
        );
        userData.addTransaction(transaction);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Transfer successful!'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Insufficient funds!'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Transfer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Recipient Phone Number'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter recipient phone number.';
                  }
                  return null;
                },
                onSaved: (value) => _recipient = value!,
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an amount.';
                  }
                  double? amount = double.tryParse(value);
                  if (amount == null || amount <= 0) {
                    return 'Please enter a valid amount.';
                  } else if (amount > userData.balance) {
                    return 'Insufficient funds.';
                  }
                  return null;
                },
                onSaved: (value) => _amount = value!,
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _handleTransfer,
                child: const Text('Transfer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserData extends ChangeNotifier {
  double balance = 1000.0;

  get transactions => null; // Initial balance

  void setBalance(double newBalance) {
    balance = newBalance;
    notifyListeners();
  }

  void addTransaction(Transaction transaction) {}

  void setAccountNumber(String accountNumber) {}

  void setLogin(bool bool) {}

  // Other methods like setLogin, setAccountNumber, addTransaction, etc.
}

enum TransactionType { Deposit, Withdrawal, Transfer }

class Transaction {
  final TransactionType type;
  final double amount;
  final String recipient;

  Transaction({
    required this.type,
    required this.amount,
    required this.recipient,
  });
}
