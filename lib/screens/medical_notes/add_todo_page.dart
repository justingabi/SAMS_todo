// ignore_for_file: prefer_const_constructors

import 'package:todo/screens/medical_notes/widgets/todo_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/medical_notes.dart';
import '../../providers/medical_notes_provider.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({Key? key}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: addTodo,
          ),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // TODO: Implement hamburger icon action
            },
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TodoFormWidget(
                onChangedTitle: (title) => setState(() => this.title = title),
                onChangedDescription: (description) =>
                    setState(() => this.description = description),
                onSavedTodo: addTodo,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addTodo() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final todo = Todo(
          title: title,
          content: description,
          noteNum: DateTime.now().toIso8601String(),
          account: '');

      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.addTodo(
          todo, 'accountID'); // Replace 'accountID' with actual account ID
      Navigator.of(context).pop();
    }
  }
}
