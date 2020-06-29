import 'package:flutter/material.dart';
import 'package:personalexpensetracker/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView(
        children:
        transactions.map((transaction){
          return Card(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.purple,
                            width: 1
                        )
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'R${transaction.amount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple,
                      ),
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.title,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        DateFormat("yMMMd").format(transaction.date),
                        style: TextStyle(
                            color: Colors.grey
                        ),
                      )
                    ],
                  )
                ],
              )
          );
        }).toList(),
      ),
    );
  }
}
