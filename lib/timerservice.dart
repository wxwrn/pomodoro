import 'dart:async';

import 'package:flutter/material.dart';

class TimerService extends ChangeNotifier {
  late Timer timer;
  double currentDuration = 300;
  double selectedTime = 300;
  bool timerPlaying = false;
  int rounds = 0;
  int goals = 0;
  String currentState = 'FOCUS';

  void start() {
    timerPlaying = true;
    --currentDuration;
    notifyListeners();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentDuration == 0) {
        handleNextRound();
      } else {
        --currentDuration;
        notifyListeners();
      }
    });
  }

  void pause() {
    timerPlaying = false;
    timer.cancel();
    notifyListeners();
  }

  void selectTime(double seconds) {
    selectedTime = seconds;
    currentDuration = seconds;

    notifyListeners();
  }

  void reset() {
    timer.cancel();
    currentState = 'FOCUS';
    currentDuration = selectedTime = 1500;
    rounds = goals = 0;
    timerPlaying = false;
    notifyListeners();
  }

  void handleNextRound() {
    if (currentState == 'FOCUS' && rounds != 3) {
      currentState = 'BREAK';
      currentDuration = 300; // 300
      selectedTime = 300;
      rounds++;
      goals++;
    } else if (currentState == 'BREAK') {
      currentState = 'FOCUS';
      currentDuration = 1500;
      selectedTime = 1500;
    } else if (currentState == 'FOCUS' && rounds == 3) {
      currentState = 'LONGBREAK';
      currentDuration = 1500;
      selectedTime = 1500;
      rounds++;
      goals++;
    } else if (currentState == 'LONGBREAK') {
      currentState = 'FOCUS';
      currentDuration = 1500;
      selectedTime = 1500;
      rounds = 0;
    }
    notifyListeners();
  }
}
