// import 'package:expense_tracker/main.dart';
import 'package:expense_tracker/widgets/Expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses, required this.onRemoveExpense});
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    //We dont know the length of data to  be entered so we use ListView insted of column Widget to make it scrolllable
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        //Swipe scroll to delete a data Dismissible is used
        background: Container(
          color: Theme.of(context).colorScheme.error,
          margin: const EdgeInsets.symmetric(horizontal: 16),
        ),
        key: ValueKey(
            expenses[index]), //A key is mandatory input for this function
        onDismissed: (direction) => onRemoveExpense(expenses[index]),
        child: ExpensesItem(expenses[index]),
      ),
    );
    //ListView(children: [],); -> This creates a scrollable view even without entering data wher the .builder will provide flexibility in only enabling scroll as the elements become visible
  }
}
