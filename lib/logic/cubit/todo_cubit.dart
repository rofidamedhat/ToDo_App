import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/core/models/todo_model.dart';
import 'package:todo_list/core/services/hive_services.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());

  getCompletedList() async {
    emit(TodoLoading());
    try {
      List<TodoModel> todos = await HiveServices.getAllToDos();

      List<TodoModel> comList =
          todos.where((element) => element.isCompleted == true).toList();
      debugPrint("All Todos:");
      for (var todo in todos) {
        print("Todo: ${todo.title}, Completed: ${todo.isCompleted}");
      }

      debugPrint(" Completed Todos:");
      for (var completedTodo in comList) {
        print(
            "Todo: ${completedTodo.title}, Completed: ${completedTodo.isCompleted}");
      }
      emit(TodoSuccess(todoList: comList));
    } catch (errMess) {
      emit(TodoError(errorMessage: 'Failed To Get Completed Todos'));
    }
  }

  getAllToDos() async {
    emit(TodoLoading());
    try {
      List<TodoModel> todos = await HiveServices.getAllToDos();
      emit(TodoSuccess(todoList: todos));
    } catch (errMess) {
      emit(TodoError(errorMessage: 'Failed To Get All Todos'));
    }
  }

  addTodo(TodoModel todoModel) async {
    emit(TodoLoading());
    try {
      await HiveServices.addToDo(todoModel);
      getAllToDos();
    } catch (e) {
      emit(TodoError(errorMessage: 'Failed To Add Todo'));
    }
  }

  updateTodo(String id, TodoModel todoModel) async {
    emit(TodoLoading());
    try {
      await HiveServices.updateTodoModel(id, todoModel);
      getAllToDos();
    } catch (e) {
      emit(TodoError(errorMessage: 'Failed To Update Todo'));
    }
  }

  deleteTodo(String id, int selectedIndex) async {
    emit(TodoLoading());
    try {
      await HiveServices.deleteTodo(id);
      if (selectedIndex == 0) {
        getAllToDos();
      } else {
        getCompletedList();
      }
    } catch (e) {
      emit(TodoError(errorMessage: 'Failed To Delete Todo'));
    }
  }

  void toggleCompletion(int index, int selectedIndex) async {
    if (state is TodoSuccess) {
      final currentState = state as TodoSuccess;
      final todo = currentState.todoList;

      await HiveServices.updateTodoModel(
          todo[index].id,
          TodoModel(
              id: todo[index].id,
              title: todo[index].title,
              details: todo[index].details,
              isCompleted: !todo[index].isCompleted));

      if (selectedIndex == 0) {
        getAllToDos();
      } else {
        getCompletedList();
      }
    }
  }
}
