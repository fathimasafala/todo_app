import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_providers.dart';
import '../widgets/custom_textfield.dart';

class EditTaskScreen extends StatelessWidget {
  final TextEditingController _taskController = TextEditingController();

  EditTaskScreen({super.key});

  void _editTask(BuildContext context, String id) {
    final taskText = _taskController.text;
    if (taskText.isNotEmpty) {
      Provider.of<TaskProvider>(context, listen: false).editTask(id, taskText);
      Navigator.of(context).pop();
    }
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final taskId = arguments['id']!;
    final taskTitle = arguments['title']!;
    _taskController.text = taskTitle;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Task'),
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
                const SizedBox(height: 50),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.brown[300],
                    ),
                    foregroundColor: const WidgetStatePropertyAll(Colors.white),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      _editTask(context, taskId);
                    }
                  },
                  child: const Text('Save Changes'),
                ),
              ],
            ),
          ),
        ));
  }
}
