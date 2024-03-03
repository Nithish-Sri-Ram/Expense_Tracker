import 'package:expense_tracker/widgets/Expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Love',
      amount: 165.69,
      date: DateTime.now(),
      category: Category.travel,
    )
  ];

  void _openaddExpense() {
    showModalBottomSheet(
      useSafeArea: true,      //This is used to make sure the camera or other device elements are overlappling the UI
      isScrollControlled: true, //To enable full screen
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final width= MediaQuery.of(context).size.width;   //alternatively 'LayoutBuilder' Widget can be used- THis is provided by flutter to assist us in the potriat and landscape features
    // print(MediaQuery.of(context).size.width);

    Widget mainContent = const Center(
      child: Text('No Expenses found! Start adding some'),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: const Color.fromARGB(255, 35, 5, 86),
        title: const Text('Flutter Expense Tracker',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),centerTitle: true,
        actions: [
          IconButton(onPressed: _openaddExpense, icon: const Icon(Icons.add))
        ],
      ),
      body: width<550? Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(child: mainContent), //To display a column within another coloumn use expanded widget
        ],
      ):
      Row(children: [
        Expanded(child: Chart(expenses: _registeredExpenses)),
          Expanded(child: mainContent),
      ],)
    );
  }
}