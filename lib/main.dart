import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_list/core/models/todo_model.dart';
import 'package:todo_list/todo_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // await Hive.deleteBoxFromDisk('todoBox');
  Hive.registerAdapter(TodoModelAdapter());

  runApp(const TodoApp());
}
