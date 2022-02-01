import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      primarySwatch: Colors.purple,
      textTheme: ThemeData.light().textTheme.copyWith(
            titleMedium: GoogleFonts.openSans(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            bodyMedium: GoogleFonts.quicksand(),
          ),
      // textTheme: GoogleFonts.quicksandTextTheme(
      //   Theme.of(context).textTheme,
      // ),
      appBarTheme: AppBarTheme(
        titleTextStyle: GoogleFonts.openSans(
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
    );
    /////////
    return MaterialApp(
      title: 'Personal Expenses',
      theme: theme,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ///////////
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 69.98,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Groceries',
    //   amount: 43.72,
    //   date: DateTime.now(),
    // ),
  ];
  ///////////
  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  ///////////
  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  ///////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: <Widget>[
          IconButton(
            onPressed: () => startAddNewTransaction(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Text("Chart"),
                elevation: 5,
                color: Colors.blueAccent,
              ),
            ),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startAddNewTransaction(context),
        backgroundColor: Colors.orangeAccent,
      ),
    );
  }
}
