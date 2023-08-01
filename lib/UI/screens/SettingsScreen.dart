// ignore_for_file: file_names

import 'package:docketday/Theme/ThemeServices.dart';
import 'package:docketday/UI/widgets/MyDrawerButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
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
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          MyDrawerButton(
            myText: Get.isDarkMode ? 'Light Theme' : 'Dark Theme',
            mySuffixIcon:
                Get.isDarkMode ? FontAwesomeIcons.sun : FontAwesomeIcons.moon,
            onClick: () {
              setState(() {
                ThemeServices().switchTheme();
              });
            },
            heightBtn: 70,
            myWidget: Switch(
              activeColor: Colors.white,
              value: Get.isDarkMode ? false : true,
              onChanged: (_) {},
            ),
          ),
          MyDrawerButton(
            myText: 'Privacy',
            mySuffixIcon: FontAwesomeIcons.lock,
            onClick: () {},
            heightBtn: 70,
          ),
          MyDrawerButton(
            myText: 'Made By Smou3lih !',
            mySuffixIcon: FontAwesomeIcons.addressCard,
            onClick: () {},
            heightBtn: 70,
          ),
        ],
      ),
    );
  }
}
