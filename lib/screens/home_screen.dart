import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:todo_list/core/colors.dart';
import 'package:todo_list/screens/add_task_screen.dart';
import 'package:todo_list/screens/widgets/all_todos_body.dart';
import 'package:todo_list/screens/widgets/complete_todos_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

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
      body: selectedIndex == 0 ? const AllTodos() : const CompleteTodos(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: const Icon(Icons.add, color: AppColors.white, size: 30),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const AddTaskScreen()));
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primaryColor,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
            print(selectedIndex);
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.checklist_rounded), label: 'All'),
          BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Completed')
        ],
      ),
    );
  }
}
