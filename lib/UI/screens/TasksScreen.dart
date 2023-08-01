// ignore_for_file: file_names

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:docketday/Theme/Theme.dart';
import 'package:docketday/UI/widgets/MyTaskTile.dart';
import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: DatePicker(
                DateTime.now(),
                height: myHeight * 0.16,
                width: myWidth * 0.18,
                initialSelectedDate: DateTime.now(),
                selectionColor: mainColor,
                selectedTextColor: Colors.white,
                deactivatedColor: Colors.grey,
                dayTextStyle: const TextStyle(color: Colors.grey),
                dateTextStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
                monthTextStyle: const TextStyle(color: Colors.grey),
                onDateChange: (date) {},
              ),
            ),
            const MyTaskTile(),
            const MyTaskTile(),
            const MyTaskTile(),
            const MyTaskTile(),
          ],
        ),
      ),
    );
  }
}
