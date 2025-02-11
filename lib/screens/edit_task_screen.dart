import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/core/colors.dart';
import 'package:todo_list/core/models/todo_model.dart';
import 'package:todo_list/logic/cubit/todo_cubit.dart';
import 'package:todo_list/screens/widgets/custom_button.dart';
import 'package:todo_list/screens/widgets/custom_text_form_field.dart';

class EditTaskScreen extends StatefulWidget {
  const EditTaskScreen({
    Key? key,
    required this.todoModel,
  }) : super(key: key);
  final TodoModel todoModel;
  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late TextEditingController titleController;
  late TextEditingController detailsController;
  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.todoModel.title);
    detailsController = TextEditingController(text: widget.todoModel.details);
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
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, color: AppColors.white)),
            toolbarHeight: 80,
            backgroundColor: AppColors.primaryColor,
            title: const Text(
              'Edit Task',
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  title: 'Title',
                  controller: titleController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Title cannot be empty';
                    }
                    return null;
                  },
                  label: const Text(
                    'Title',
                    style:
                        TextStyle(color: AppColors.primaryColor, fontSize: 20),
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  title: 'Details',
                  controller: detailsController,
                  maxLines: 3,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Details cannot be empty';
                    }
                    return null;
                  },
                  label: const Text(
                    'Details',
                    style:
                        TextStyle(color: AppColors.primaryColor, fontSize: 20),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButton(
                      text: 'Update',
                      width: 150,
                      onPressed: () {
                        setState(() {
                          widget.todoModel.title = titleController.text;
                          widget.todoModel.details = detailsController.text;
                        });
                        if (formKey.currentState!.validate()) {
                          context.read<TodoCubit>().updateTodo(
                              widget.todoModel.id,
                              TodoModel(
                                title: titleController.text,
                                details: detailsController.text,
                                id: widget.todoModel.id,
                              ));
                          Navigator.pop(context);
                        }
                      },
                    ),
                    CustomButton(
                      text: 'Cancel',
                      width: 150,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
