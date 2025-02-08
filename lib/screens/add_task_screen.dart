import 'package:flutter/material.dart';
import 'package:todo_list/core/colors.dart';
import 'package:todo_list/screens/widgets/custom_button.dart';
import 'package:todo_list/screens/widgets/custom_text_form_field.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.purbleD6,
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: AppColors.primaryColor,
          title: const Text(
            'Add Task',
            style: TextStyle(
                color: AppColors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 30),
          child: Column(
            children: [
              CustomTextFormField(
                title: 'Title',
                label: Text(
                  'Title',
                  style: TextStyle(color: AppColors.primaryColor, fontSize: 20),
                ),
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                title: 'Details',
                maxLines: 3,
                label: Text(
                  'Details',
                  style: TextStyle(color: AppColors.primaryColor, fontSize: 20),
                ),
              ),
              SizedBox(height: 30),
              CustomButton(text: 'ADD')
            ],
          ),
        ));
  }
}
