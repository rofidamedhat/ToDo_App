import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/core/models/todo_model.dart';

class HiveServices {
  static const String todoBox = "todoBox";

  static Future<List<TodoModel>> getAllToDos() async {
    Box<TodoModel> box = await Hive.openBox<TodoModel>(todoBox);
    return box.values.toList();
  }

  static Future<void> addToDo(TodoModel todoModel) async {
    Box<TodoModel> box = await Hive.openBox<TodoModel>(todoBox);
    box.add(todoModel);
  }

  static updateTodoModel(String id, TodoModel todoModel) async {
    Box<TodoModel> box = await Hive.openBox<TodoModel>(todoBox);
    var updatedTodo = box.values.firstWhere(
      (element) => element.id == id,
      orElse: () => TodoModel(id: "", title: "", details: ""),
    );
    if (updatedTodo.id != "") {
      await box.put(updatedTodo.key, todoModel);
    } else {
      print("Todo not found to update");
    }
  }

  static deleteTodo(String id) async {
    Box<TodoModel> box = await Hive.openBox<TodoModel>(todoBox);
    var deleteTodo = box.values.firstWhere(
      (element) => element.id == id,
      orElse: () => TodoModel(id: "", title: "", details: ""),
    );
    if (deleteTodo.id != "") {
      await box.delete(deleteTodo.key);
    } else {
      print("Todo not found to delete");
    }
  }
}
