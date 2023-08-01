// ignore_for_file: file_names

import 'package:docketday/Theme/Theme.dart';
import 'package:docketday/UI/widgets/MyButton.dart';
import 'package:docketday/UI/widgets/MyTextField.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
        ),
        leading: Center(
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const FaIcon(FontAwesomeIcons.chevronLeft),
          ),
        ),
        centerTitle: true,
        title: const Text('Create New Task'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        MyTextField(
                          validate: (taskName) {
                            if (taskName.isEmpty) {
                              return 'Task name should not be empty !';
                            }
                          },
                          textType: TextInputType.text,
                          maxLines: 1,
                          readonly: false,
                          helperText: 'Task Name',
                          hint: 'Enter you task name',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: myWidth * 0.45,
                              child: MyTextField(
                                validate: (date) {
                                  if (date.isEmpty) {
                                    return 'Date should not be empty !';
                                  }
                                },
                                textType: TextInputType.datetime,
                                readonly: true,
                                helperText: 'Date',
                                hint: 'task date',
                                suffixIcon: FontAwesomeIcons.calendar,
                                suffixIconClick: () {},
                              ),
                            ),
                            SizedBox(
                              width: myWidth * 0.45,
                              child: MyTextField(
                                validate: (time) {
                                  if (time.isEmpty) {
                                    return 'Time should not be empty !';
                                  }
                                },
                                readonly: true,
                                textType: TextInputType.datetime,
                                helperText: 'Time',
                                hint: 'task time',
                                suffixIcon: FontAwesomeIcons.clock,
                                suffixIconClick: () {},
                              ),
                            ),
                          ],
                        ),
                        MyTextField(
                          validate: (description) {
                            if (description.isEmpty) {
                              return 'Description should not be empty !';
                            }
                          },
                          maxLines: 7,
                          textType: TextInputType.text,
                          helperText: 'Description',
                          hint: 'Enter your Description',
                          readonly: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //! Create task btn
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: MyButton(
                btnColor: mainColor,
                height: myHeight * 0.09,
                width: double.infinity,
                text: 'Create New Task',
                onTap: () {
                  formKey.currentState!.validate();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
