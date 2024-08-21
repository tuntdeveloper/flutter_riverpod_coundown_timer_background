import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_story_ticket/model/timer_model.dart';

final timerViewModelProvider = ChangeNotifierProvider<TimerViewModel>((ref) {
  return TimerViewModel();
});

class TimerViewModel extends ChangeNotifier {
  final TimerModel _timerModel = TimerModel();
  Timer? _timer;

  int get remainingSeconds => _timerModel.remainingSeconds;

  bool get isFinished => _timerModel.isFinished();

  bool get isRunning => _timer != null && _timer!.isActive;

  TimerViewModel();

  void startTimer() {
    _timerModel.reset();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!_timerModel.isFinished()) {
        _timerModel.decrement();
      } else {
        _timer?.cancel();
      }
      notifyListeners();
    });
  }

  void stopTimer() {
    _timer?.cancel();
    _timer = null;
    _timerModel.reset();
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
