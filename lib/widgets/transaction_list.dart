import 'package:flutter/material.dart';

import './transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransactions;

  TransactionList(this.transactions, this.deleteTransactions);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constrains) {
              return Column(
                children: <Widget>[
                  Text(
                    'No transactions added yet!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: constrains.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      )),
                ],
              );
            },
          )
        // : ListView.builder(

        //     itemBuilder: (ctx, index) {
        //       return TransactionItem(
        //         key: (),
        //           transactions: transactions[index],
        //           deleteTransactions: deleteTransactions);
        //     },
        //     itemCount: transactions.length,
        //   );

        : ListView(
            children: transactions
                .map(
                  (e) => TransactionItem(
                      key: ValueKey(e.id),
                      transactions: e,
                      deleteTransactions: deleteTransactions),
                )
                .toList(),
          );
  }
}
