import 'dart:async';

import 'package:flutter/material.dart';

import '../../view/custom_text_field_builder.dart';
import '../../../constants/strings_manager.dart';
import '../../services/notification_services.dart';
import '../../view/scaffold_background_builder.dart';

class ConfirmCodeScreen extends StatefulWidget {
  final String name;
  final String phone;
  const ConfirmCodeScreen({
    Key? key,
    required this.name,
    required this.phone,
  }) : super(key: key);

  @override
  State<ConfirmCodeScreen> createState() => _ConfirmCodeScreenState();
}

class _ConfirmCodeScreenState extends State<ConfirmCodeScreen> {
  NotificationService notificationService = NotificationService();
  Timer? timer;
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _sndController = TextEditingController();
  final TextEditingController _thController = TextEditingController();
  final TextEditingController _foController = TextEditingController();

  @override
  void initState() {
    super.initState();
    timer = Timer(const Duration(seconds: 2), _notifyUser);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ScaffoldBackGroundBuilder(),
        Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.verPhone),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: CustomTextFormFieldBuilder(
                        controller: _firstController,
                      ),
                    ),
                    Expanded(
                      child: CustomTextFormFieldBuilder(
                        controller: _sndController,
                      ),
                    ),
                    Expanded(
                      child: CustomTextFormFieldBuilder(
                        controller: _thController,
                      ),
                    ),
                    Expanded(
                      child: CustomTextFormFieldBuilder(
                        controller: _foController,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _notifyUser() {
    notificationService.showNotifications(code: '1313');
  }

  @override
  void dispose() {
    _firstController.dispose();
    _sndController.dispose();
    _thController.dispose();
    _foController.dispose();
    super.dispose();
  }
}
