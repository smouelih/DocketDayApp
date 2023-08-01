// ignore_for_file: must_be_immutable, file_names

import 'package:docketday/Theme/Theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyDrawerButton extends StatelessWidget {
  MyDrawerButton({
    super.key,
    required this.myText,
    required this.mySuffixIcon,
    required this.onClick,
    required this.heightBtn,
    this.myWidget,
    this.myColor,
  });

  final String myText;
  final IconData mySuffixIcon;
  Function() onClick;
  double? heightBtn;
  Widget? myWidget;
  Color? myColor;
  Widget? myContainer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: myColor,
          height: heightBtn,
          width: double.infinity,
          child: MaterialButton(
            onPressed: onClick,
            child: Row(
              children: [
                FaIcon(
                  mySuffixIcon,
                  color: mainColor,
                ),
                const SizedBox(width: 10),
                Text(
                  myText,
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    letterSpacing: 2,
                  ),
                ),
                const Spacer(),
                myWidget ?? Container(),
              ],
            ),
          ),
        ),
        myContainer ?? Container(),
      ],
    );
  }
}
