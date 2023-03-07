import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransactionHandler;

  NewTransaction(this.addTransactionHandler);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  void submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTransactionHandler(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: _titleController,
              // onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              // onSubmitted: (_) => submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Text('No Date Chosen!'),
                  TextButton(
                      onPressed: () {},
                      child: Text('Choose Date',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold))),
                ],
              ),
            ),
            TextButton(
                onPressed: submitData,
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor)),
                child: Text(
                  'Add Transaction',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Theme.of(context).textTheme.labelLarge?.color),
                ))
          ],
        ),
      ),
    );
  }
}
