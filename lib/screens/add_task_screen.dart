import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/task_providers.dart';
import 'package:todoapp/widgets/custom_textfield.dart';
import '../models/data_model.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController _taskController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  AddTaskScreen({super.key});

  void _addTask(BuildContext context) {
    final taskText = _taskController.text;
    if (taskText.isNotEmpty) {
      Provider.of<TaskProvider>(context, listen: false).addTask(
        Task(
          id: DateTime.now().toString(),
          title: taskText,
          isDone: false,
        ),
      );
      Navigator.of(context).pop(); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              CustomTextFormFields(
                controller: _taskController,
                isColordBackground: true,
                hintText: "Task",
                isFill: false,
                validation: (name) {
                  if (name != null && name.isNotEmpty) {
                    return null;
                  } else {
                    return "Required";
                  }
                },
              ),
              const SizedBox(height: 120),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Colors.brown[300],
                  ),
                  foregroundColor: const WidgetStatePropertyAll(Colors.white),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    _addTask(context);
                  }
                },
                child: const Text('Add Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
