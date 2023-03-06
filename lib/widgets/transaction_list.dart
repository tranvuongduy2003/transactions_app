import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: EdgeInsets.all(10),
      // child: ListView(
      //   children: transactions.map((transaction) {
      //     return Card(
      //       child: Row(
      //         children: <Widget>[
      //           Container(
      //             margin: EdgeInsets.symmetric(
      //               vertical: 10,
      //               horizontal: 15,
      //             ),
      //             decoration: BoxDecoration(
      //               border: Border.all(
      //                 color: Colors.purple,
      //                 width: 2,
      //               ),
      //             ),
      //             padding: EdgeInsets.all(10),
      //             child: Text('\$${transaction.amount.toString()}',
      //                 style: TextStyle(
      //                     fontWeight: FontWeight.bold,
      //                     fontSize: 20,
      //                     color: Colors.purple)),
      //           ),
      //           Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: <Widget>[
      //               Text(
      //                 transaction.title,
      //                 style:
      //                     TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      //               ),
      //               Text(DateFormat.yMd().format(transaction.date),
      //                   style: TextStyle(
      //                     color: Colors.grey,
      //                   ))
      //             ],
      //           )
      //         ],
      //       ),
      //     );
      //   }).toList(),
      // ),
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text('No transactions added yet!',
                    style: Theme.of(context).textTheme.titleLarge),
                SizedBox(height: 20,),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ))
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                            '\$${transactions[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Theme.of(context).primaryColor)),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            transactions[index].title,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                              DateFormat.yMd().format(transactions[index].date),
                              style: TextStyle(
                                color: Colors.grey,
                              ))
                        ],
                      )
                    ],
                  ),
                );
              }),
    );
  }
}
