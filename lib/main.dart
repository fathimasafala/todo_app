import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/task_providers.dart';
import 'package:todoapp/screens/edit_tsk_screen.dart';
import 'screens/home_screen.dart';
import 'screens/add_task_screen.dart';

void main() {
  runApp(const MyTodoApp());
}

class MyTodoApp extends StatelessWidget {
  const MyTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        title: 'Todo App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            // ignore: prefer_const_constructors
            appBarTheme: AppBarTheme(
                color: Colors.brown[300],
                centerTitle: true,
                titleTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
                elevation: 0,
                actionsIconTheme: const IconThemeData(
                  color: Colors.white,
                ))),
        initialRoute: '/',
        routes: {
          '/': (ctx) => const HomeScreen(),
          '/add-task': (ctx) => AddTaskScreen(),
          '/edit-task': (context) => EditTaskScreen(),
        },
      ),
    );
  }
}
