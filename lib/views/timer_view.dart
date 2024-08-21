import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_story_ticket/services/notification_service.dart';
import 'package:gym_story_ticket/viewmodel/timer_viewmodel.dart';

class TimerView extends ConsumerStatefulWidget {
  const TimerView({super.key});

  @override
  ConsumerState<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends ConsumerState<TimerView> {
  @override
  Widget build(BuildContext context) {
    ref.listen<TimerViewModel>(timerViewModelProvider, (_, next) async {
      if (next.isFinished) {
        await NotificationService.dismissAllNotification();
        return;

        // Integrate another notification when finished.
        // NotificationService.dismissAllNotification();
        // NotificationService.createNotification(10, 'Countdown is finished');
        // return;
      }

      await NotificationService.createNotification(10, '${next.remainingSeconds} seconds remaining');
    });
    final timerViewModel = ref.watch(timerViewModelProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Countdown Timer')),
      body: SizedBox.expand(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${timerViewModel.remainingSeconds} seconds remaining',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: timerViewModel.isRunning ? null : timerViewModel.startTimer,
                child: const Text('Start countdown'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: timerViewModel.isRunning ? timerViewModel.stopTimer : null,
                child: const Text('Stop countdown'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
