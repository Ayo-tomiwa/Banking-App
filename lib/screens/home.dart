import 'package:bankingapp/screens/deposit.dart';
import 'package:bankingapp/screens/transactions.dart';
import 'package:bankingapp/screens/transfer.dart';
import 'package:bankingapp/screens/withdrawal.dart';
import 'package:bankingapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Balance: ₦${userData.balance.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 24.0),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  text: 'Deposit',
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DepositScreen()),
                  ),
                ),
                const SizedBox(width: 20.0),
                CustomButton(
                  text: 'Withdrawal',
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WithdrawalScreen()),
                  ),
                ),
                const SizedBox(width: 20.0),
                CustomButton(
                  text: 'Transfer',
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TransferScreen()),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TransactionsScreen()),
              ),
              child: const Text('Transaction History'),
            ),
          ],
        ),
      ),
    );
  }
}
