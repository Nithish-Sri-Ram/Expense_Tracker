import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';   //Used to check if the platform is IOS or android

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountInput = TextEditingController();
  DateTime?
      _selectedDate; //?- is to indicate it either stores a value od datetime or nothing
  Category _selectedCategory = Category.food;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: now,
    );
    //This line executes only after a value is been recived and stored,
    setState(
      () {
        _selectedDate = pickedDate;
      },
    );
  }

  void _showErrorMessage()
  {
    if(Platform.isIOS)
    {
        showCupertinoDialog(
        context: context,
        builder: (ctx) => CupertinoAlertDialog(
          title: const Text('Invalud Input'),
          content: const Text('Please enter all correct values'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
    }
    
    if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalud Input'),
          content: const Text('Please enter all correct values'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
    }
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(
        _amountInput.text); //tryparse('Hello')=>null and tryparse('3.12')=>3.12
    final isAmountInv = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        isAmountInv ||
        _selectedDate == null) {
      _showErrorMessage();

      return;
    }

    widget.onAddExpense(
      Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory,
      ),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _amountInput.dispose();
    _titleController
        .dispose(); //To reduce memory consumption as this textEditingController takes space unnecesarryly even if it is not used
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyBoardSpace = MediaQuery.of(context)
        .viewInsets
        .bottom; //This is used to calculate the space availabla at the bottom

    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + keyBoardSpace),
          child: Column(
            children: [
              //THe .name is used to convert enum to text - string
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map((categ) => DropdownMenuItem(
                          value: categ, child: Text(categ.name.toUpperCase())))
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  }),
              TextField(
                // onChanged: _saveTitle,
                controller: _titleController,
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Title'),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _amountInput,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        prefixText: '\$ ',
                        label: Text('Amount'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // the ! after _printing selected date is to forcibily mention that it wont have a null value
                      Text(_selectedDate == null
                          ? 'No date selected'
                          : formatter.format(_selectedDate!)),
                      IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(Icons.calendar_month),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(
                          context); //built in method to go back to the previous page
                    },
                    child: const Text('Cancel'),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: _submitExpenseData,
                    child: const Text('Save Expense'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
