import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:todo_list/core/colors.dart';
import 'package:todo_list/logic/cubit/todo_cubit.dart';
import 'package:todo_list/screens/add_task_screen.dart';
import 'package:todo_list/screens/widgets/all_todo_body.dart';
import 'package:todo_list/screens/widgets/completed_todo_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  showTodosbody(int value) {
    setState(() {
      selectedIndex = value;
    });
    if (selectedIndex == 0) {
      context.read<TodoCubit>().getAllToDos();
    } else if (selectedIndex == 1) {
      context.read<TodoCubit>().getCompletedList();
    }
  }

  List<Widget> screens = [
    const AllTodoBody(),
    const CompletedTodoBody(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.purbleD6,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          'TODO APP',
          style: TextStyle(
              color: AppColors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600),
        ),
        actions: [SvgPicture.asset('assets/icons/calendar.svg')],
      ),
      body: screens[selectedIndex],
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: const Icon(Icons.add, color: AppColors.white, size: 30),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(
                    builder: (context) => const AddTaskScreen()))
                .then((value) => context.read<TodoCubit>().getAllToDos());
          }),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedIndex,
        onTap: showTodosbody,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.checklist_rounded), label: 'All'),
          BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Completed')
        ],
      ),
    );
  }
}
