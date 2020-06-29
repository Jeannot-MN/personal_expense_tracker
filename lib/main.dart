import 'package:flutter/material.dart';
import 'package:personalexpensetracker/widgets/new_transaction.dart';

import 'models/transaction.dart';
import 'widgets/transaction_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
final List<Transaction> transactions = [
    Transaction(id: "t1", title: "New Shoes", amount: 30, date: DateTime.now()),
    Transaction(id: "T2", title: "Groceries", amount: 70, date: DateTime.now())
  ];

  void addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());
    setState(() {
      transactions.add(newTransaction);
    });
  }

  void openAddNewTransactionModal(BuildContext context) {
    showModalBottomSheet(context: context, builder: (_) {
      return NewTransaction(addNewTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Expense Planner App"),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                  Icons.add
              ),
              onPressed: () => openAddNewTransactionModal(context),

            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
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
                    children: <Widget>[
                      TransactionList(transactions),
                    ]
                ),
              ]
          )
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.add
            ),
            onPressed: () => openAddNewTransactionModal(context),
        ),
    );
  }
}
