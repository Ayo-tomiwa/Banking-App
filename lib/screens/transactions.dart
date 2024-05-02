import 'package:bankingapp/screens/transfer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Transaction {
  final String recipient;
  final double amount;
  final DateTime timestamp;

  Transaction(this.recipient, this.amount, this.timestamp, {required type});
}

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context);

    // Replace with logic to fetch transaction history from API (if needed)
    final transactions =
        userData.transactions ?? []; // Placeholder for transactions

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final transaction = transactions[index];
            return TransactionListItem(
                transaction:
                    transaction); // Custom widget for each transaction item
          },
        ),
      ),
    );
  }
}

class TransactionListItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionListItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons
          .transfer_within_a_station), // Adjust icon based on transaction type
      title: Text(transaction.recipient),
      subtitle: Text(
        '₦${transaction.amount.toStringAsFixed(2)} - ${formatDate(transaction.timestamp)}',
        style: const TextStyle(fontSize: 14.0),
      ),
    );
  }

  // Function to format date (replace with your desired formatting)
  String formatDate(DateTime date) {
    return DateFormat('dd MMM yyyy').format(date);
  }
}
