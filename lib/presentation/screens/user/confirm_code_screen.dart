import 'dart:async';

import 'package:flutter/material.dart';
import '../../services/notification_services.dart';

class ConfirmCodeScreen extends StatefulWidget {
  const ConfirmCodeScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmCodeScreen> createState() => _ConfirmCodeScreenState();
}

class _ConfirmCodeScreenState extends State<ConfirmCodeScreen> {
  NotificationService notificationService = NotificationService();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(const Duration(seconds: 2), _notifyUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }

  void _notifyUser() {
    notificationService.showNotifications(code: '1313');
  }
}
