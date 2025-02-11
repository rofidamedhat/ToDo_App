import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/core/colors.dart';
import 'package:todo_list/logic/cubit/todo_cubit.dart';

class CompletedTodoBody extends StatelessWidget {
  const CompletedTodoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoState>(
      builder: (context, state) {
        if (state is TodoLoading) {
          return const Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor));
        } else if (state is TodoSuccess) {
          final compList = state.todoList;
          if (compList.isEmpty) {
            return const Center(
                child: Text('No Completed Tasks',
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w600)));
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: ListView.builder(
              itemCount: state.todoList.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(compList[index].title,
                                style: const TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600)),
                            Text(
                              compList[index].details,
                              style: const TextStyle(
                                  color: AppColors.black, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        child: const Icon(Icons.delete_outline_outlined,
                            color: AppColors.primaryColor, size: 22),
                        onTap: () {
                          context
                              .read<TodoCubit>()
                              .deleteTodo(compList[index].id, 1);
                        },
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        child: const Icon(Icons.check_box_rounded,
                            color: AppColors.primaryColor, size: 22),
                        onTap: () {
                          context.read<TodoCubit>().toggleCompletion(index,1);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        } else if (state is TodoError) {
          return Center(
              child: Text(state.errorMessage,
                  style: const TextStyle(color: AppColors.white)));
        }
        return const Center(
            child: Text('Something went wrong',
                style: TextStyle(color: AppColors.white)));
      },
    );
  }
}
