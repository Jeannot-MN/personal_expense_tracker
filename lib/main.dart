import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id:"t1", title: "New Shoes", amount: 30, date: DateTime.now()),
    Transaction(id:"T2", title: "Groceries", amount: 70, date: DateTime.now())
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Expense Planner App")),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                child: Container(
                  color: Colors.blue,
                  width: double.infinity,
                  child: Text("CHART!"),
                ),
                elevation: 5,
              ),
              Column(
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
                              'R${transaction.amount}',
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

        ]),
      ),
    );
  }
}
