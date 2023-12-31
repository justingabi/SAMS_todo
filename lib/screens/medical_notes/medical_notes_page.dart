// ignore_for_file: prefer_const_constructors

import 'package:todo/screens/medical_notes/add_todo_page.dart';
import 'package:todo/screens/medical_notes/widgets/completed_list_widget.dart';
import 'package:todo/screens/medical_notes/widgets/todo_list_widget.dart';

import 'package:flutter/material.dart';

class MedicalNotes extends StatefulWidget {
  const MedicalNotes({Key? key}) : super(key: key);

  @override
  _MedicalNotesState createState() => _MedicalNotesState();
}

class _MedicalNotesState extends State<MedicalNotes>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: [
          const TodoListWidget(),
          const CompletedListWidget(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Color(0xFFFF6969),
        onPressed: () => showDialog(
          context: context,
          builder: (_) => AddTodoPage(),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 200),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.edit),
            ],
          ),
        ),
      ),
    );
  }
}
