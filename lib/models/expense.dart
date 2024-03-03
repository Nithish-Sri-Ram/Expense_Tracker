import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid =
    Uuid(); //THish is a built in package with flutter used to generate unique id's and it can be imported by running the commmand in the terminal by  ' flutter pub add uuid'

enum Category {
  food,
  travel,
  leisure,
  work,
}
//TO create fixed set of allowed values - ENUMS

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category});

  final String id = uuid.v4();
  final String title;
  final double amount;
  final DateTime date;
  final Category category; //The enum is used like a seperate data type

  get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.expenses, required this.category});
  final List<Expense> expenses;
  final Category category;

  ExpenseBucket.forCategory(List<Expense> allExpense, this.category)
      : expenses = allExpense
            .where((expense) => expense.category == category)
            .toList();

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum = sum + expense.amount;
    }
    return sum;
  }
}
