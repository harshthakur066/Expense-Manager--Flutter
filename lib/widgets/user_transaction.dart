import 'package:flutter/material.dart';
import './new_transactions.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'Netflix',
      amount: 800,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Books',
      amount: 300,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        amount: txAmount,
        date: DateTime.now(),
        title: txTitle);

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      NewTransations(_addNewTransaction),
      TransactionList(_userTransactions),
    ]);
  }
}
