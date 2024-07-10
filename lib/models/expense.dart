import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

DateFormat formatter = DateFormat.yMd();

const uuid = Uuid();

enum Catagory {
  food,
  travel,
  leisure,
  work,
}

const categortIcons = {
  Catagory.food: Icons.fastfood,
  Catagory.travel: Icons.flight,
  Catagory.leisure: Icons.sports_soccer,
  Catagory.work: Icons.work,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.catagory,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Catagory catagory;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.catagory,
    required this.expenses,
  });

  ExpenseBucket.forCatagory(
    List<Expense> allExpenses,
    this.catagory,
  ) : expenses = allExpenses
            .where((expense) => expense.catagory == catagory)
            .toList();

  final Catagory catagory;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
