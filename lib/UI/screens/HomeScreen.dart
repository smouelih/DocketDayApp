// ignore_for_file: must_be_immutable, file_names, unused_local_variable

import 'package:docketday/UI/screens/AddTaskScreen.dart';
import 'package:docketday/UI/screens/ArchivedTasksScreen.dart';
import 'package:docketday/UI/screens/SettingsScreen.dart';
import 'package:docketday/UI/screens/TasksScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../Theme/Theme.dart';
import '../widgets/MyDrawerButton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<SliderDrawerState> myDrawerKey =
      GlobalKey<SliderDrawerState>();

  List<Widget> myScreens = [
    const TasksScreen(),
    const ArchivedTasksScreen(),
  ];
  List<String> titles = [
    'Tasks',
    'Archived',
  ];
  int currentindex = 0;

  bool isDrawerOpen = true;

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      //! Animated Slider
      body: SliderDrawer(
        sliderOpenSize: myWidth * 0.7,
        key: myDrawerKey,
        //! AppBar
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          leading: IconButton(
            onPressed: () {
              myDrawerKey.currentState!.toggle();
            },
            icon: const FaIcon(
              FontAwesomeIcons.barsStaggered,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          title: Text(titles[currentindex]),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                  Get.to(const AddTaskScreen());
                },
                icon: const FaIcon(
                  FontAwesomeIcons.penToSquare,
                ),
              ),
            )
          ],
        ),
        //! Drawer design
        slider: SingleChildScrollView(
          child: Column(
            children: [
              //! Logo image
              Container(
                color: mainColor,
                height: 250,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/images/logo.png',
                        scale: 4,
                      ),
                    ),
                    const SizedBox(height: 10),
                    //! App name
                    const Text(
                      'Docket Day',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              //! Home btn
              MyDrawerButton(
                heightBtn: 60.0,
                myText: 'Home',
                mySuffixIcon: FontAwesomeIcons.houseChimney,
                onClick: () {},
              ),
              //! Add task btn
              MyDrawerButton(
                heightBtn: 60.0,
                myText: 'Add Task',
                mySuffixIcon: FontAwesomeIcons.calendarPlus,
                onClick: () {
                  Get.to(const AddTaskScreen());
                },
              ),
              //! Settings btn
              MyDrawerButton(
                heightBtn: 60.0,
                myText: 'Settings',
                mySuffixIcon: FontAwesomeIcons.gears,
                onClick: () {
                  Get.to(const SettingsScreen());
                },
              ),
              //! Share btn
              MyDrawerButton(
                heightBtn: 60.0,
                myText: 'Share',
                mySuffixIcon: FontAwesomeIcons.solidShareFromSquare,
                onClick: () {},
              ),
              //! separated
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey,
              ),
              //! invite friends btn
              MyDrawerButton(
                heightBtn: 60.0,
                myText: 'Invite Friends',
                mySuffixIcon: FontAwesomeIcons.userPlus,
                onClick: () {},
              ),
              //! FAQ btn
              MyDrawerButton(
                heightBtn: 60.0,
                myText: 'Docket Day FAQ',
                mySuffixIcon: FontAwesomeIcons.circleQuestion,
                onClick: () {},
              )
            ],
          ),
        ),
        //! Main Page
        child: myScreens[currentindex],
      ),
      //! bottom nav bar
      bottomNavigationBar: GNav(
        selectedIndex: currentindex,
        onTabChange: (index) {
          setState(() {
            currentindex = index;
          });
        },
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        color: mainColor,
        tabBackgroundColor: mainColor,
        activeColor: Colors.white,
        gap: 8,
        tabMargin: EdgeInsets.symmetric(vertical: myHeight * 0.009),
        padding: const EdgeInsets.all(20),
        tabs: const [
          GButton(
            icon: FontAwesomeIcons.listCheck,
            text: 'Tasks',
          ),
          GButton(
            icon: FontAwesomeIcons.boxArchive,
            text: 'Archived',
          ),
        ],
      ),
    );
  }
}
