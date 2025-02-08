import 'package:flutter/material.dart';
import 'package:todo_list/core/colors.dart';
import 'package:todo_list/screens/edit_task_screen.dart';

class AllTodos extends StatelessWidget {
  const AllTodos({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Container(
          height: 82,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              const Expanded(
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TODO TITLE',
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'TODO SUB TITLE',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const EditTaskScreen(),
                  ));
                },
                child: const Icon(Icons.edit_outlined,
                    color: AppColors.primaryColor, size: 25),
              ),
              const SizedBox(width: 15),
              const Icon(Icons.delete_outline_outlined,
                  color: AppColors.primaryColor, size: 25),
              const SizedBox(width: 15),
              const Icon(Icons.check_box_outlined,
                  color: AppColors.primaryColor, size: 25),
            ],
          ),
        ));
  }
}
