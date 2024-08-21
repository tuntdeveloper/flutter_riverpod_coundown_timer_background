import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_story_ticket/services/notification_service.dart';
import 'package:gym_story_ticket/services/permission_service.dart';
import 'package:gym_story_ticket/views/timer_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PermissionService.requestPermission();
  await NotificationService.initialize();

  runApp(ProviderScope(
      child: MaterialApp(
          title: 'Timer Counter',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const TimerView())));
}
