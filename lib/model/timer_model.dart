class TimerModel {
  int _remainingSeconds = 10;

  int get remainingSeconds => _remainingSeconds;

  void decrement() {
    if (_remainingSeconds > 0) {
      _remainingSeconds--;
    }
  }

  void reset() {
    _remainingSeconds = 10;
  }

  bool isFinished() => _remainingSeconds == 0;
}