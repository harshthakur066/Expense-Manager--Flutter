import 'package:flutter/material.dart';

class NewTransations extends StatefulWidget {
  final Function addTransaction;

  NewTransations(this.addTransaction);

  @override
  _NewTransationsState createState() => _NewTransationsState();
}

class _NewTransationsState extends State<NewTransations> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enterdTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enterdTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTransaction(
      enterdTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Tiltle'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
