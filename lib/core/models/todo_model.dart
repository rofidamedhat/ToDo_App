// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String details;

  @HiveField(3)
  bool isCompleted;
  TodoModel({
    required this.id,
    required this.title,
    required this.details,
    this.isCompleted = false,
  });
}
