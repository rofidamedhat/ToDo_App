part of 'todo_cubit.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

final class TodoLoading extends TodoState {}

final class TodoSuccess extends TodoState {
  final List<TodoModel> todoList;
  TodoSuccess({required this.todoList});
}

final class TodoError extends TodoState {
  final String errorMessage;
  TodoError({required this.errorMessage});
}
