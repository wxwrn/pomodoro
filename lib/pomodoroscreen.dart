import 'package:flutter/material.dart';
import 'package:pomodoro/utils.dart';
import 'package:pomodoro/widgets/progresswidget.dart';
import 'package:pomodoro/widgets/timecontroller.dart';
import 'package:pomodoro/widgets/timeoptions.dart';
import 'package:pomodoro/widgets/timercard.dart';

class PomodoroScreen extends StatelessWidget {
  const PomodoroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.redAccent,
        title: Text(
          'POMODORO',
          style: textStyle(
            25,
            Colors.white,
            FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.rotate_left_rounded,
              color: Colors.white,
            ),
            iconSize: 40,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: const Column(
            children: [
              SizedBox(height: 15),
              TimerCard(),
              SizedBox(height: 40),
              TimeOptions(),
              SizedBox(height: 30),
              TimeController(),
              SizedBox(height: 30),
              ProgressWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
