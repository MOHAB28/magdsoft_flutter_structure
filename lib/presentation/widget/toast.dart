import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../styles/colors.dart';

final FToast fToast = FToast();
void showToast(String? text) {
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: AppColors.grey,
    ),
    child: Text(text!),
  );

  fToast.showToast(
    child: toast,
    gravity: ToastGravity.TOP,
    toastDuration: const Duration(seconds: 2),
  );
}