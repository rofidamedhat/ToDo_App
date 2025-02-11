import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/core/colors.dart';
import 'package:todo_list/core/models/todo_model.dart';
import 'package:todo_list/logic/cubit/todo_cubit.dart';
import 'package:todo_list/screens/widgets/custom_button.dart';
import 'package:todo_list/screens/widgets/custom_text_form_field.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late TextEditingController titleController;
  late TextEditingController detailsController;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    detailsController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    detailsController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.purbleD6,
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: AppColors.primaryColor,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: AppColors.white)),
          title: const Text(
            'Add Todo',
            style: TextStyle(
                color: AppColors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Title cannot be empty';
                    }
                    return null;
                  },
                  title: 'Title',
                  controller: titleController,
                  label: const Text(
                    'Title',
                    style:
                        TextStyle(color: AppColors.primaryColor, fontSize: 20),
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Details cannot be empty';
                    }
                    return null;
                  },
                  title: 'Details',
                  maxLines: 3,
                  controller: detailsController,
                  label: const Text(
                    'Details',
                    style:
                        TextStyle(color: AppColors.primaryColor, fontSize: 20),
                  ),
                ),
                const SizedBox(height: 30),
                CustomButton(
                  text: 'ADD',
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      context.read<TodoCubit>().addTodo(TodoModel(
                            title: titleController.text,
                            details: detailsController.text,
                            id: DateTime.now().toString(),
                          ));
                      Navigator.pop(context);
                    }
                  },
                )
              ],
            ),
          ),
        ));
  }
}
