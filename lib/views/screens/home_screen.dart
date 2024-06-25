// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final AnimationController _animationController;
  late final Animation<double> _containerAnimation;
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: InkWell(
        onTap: () {
          isOn = !isOn;
          setState(() {});
        },
        child: AnimatedContainer(
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 600),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: isOn ? Colors.blue[400] : Colors.grey[400],
          ),
          height: 50,
          width: 100,
          padding: EdgeInsets.all(5),
          child: AnimatedAlign(
            curve: Curves.easeOut,
            alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
            duration: const Duration(milliseconds: 600),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: AnimatedCrossFade(
                firstCurve: Curves.easeOut,
                secondCurve: Curves.easeIn,
                firstChild: Icon(
                  CupertinoIcons.paperplane,
                  color: Colors.grey[400],
                ),
                secondChild: Icon(
                  CupertinoIcons.paperplane_fill,
                  color: Colors.blue,
                ),
                duration: Duration(milliseconds: 600),
                crossFadeState:
                    isOn ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              ),
            ),
          ),
        ),
      )),
    );
  }
}
