import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_providers.dart';
import '../widgets/task_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<TaskProvider>(context).tasks;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
      ),
      body: tasks.isEmpty
          ? const Center(child: Text('No Tasks!'))
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (ctx, index) {
                final task = tasks[index];
                return TaskTile(
                  title: task.title,
                  isDone: task.isDone,
                  onChanged: (value) {
                    Provider.of<TaskProvider>(context, listen: false)
                        .toggleTaskStatus(task.id);
                  },
                  onDelete: () {
                    Provider.of<TaskProvider>(context, listen: false)
                        .deleteTask(task.id);
                  },
                  onEdit: () {
                    Navigator.of(context).pushNamed(
                      '/edit-task',
                      arguments: {'id': task.id, 'title': task.title},
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown[300],
        onPressed: () {
          Navigator.of(context).pushNamed('/add-task');
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
