import 'package:flutter/material.dart';
import '../styles/colors.dart';

enum StateController { loading, error }

void showMyDialog({
  required BuildContext context,
  required StateController state,
  String message = '',
}) {
  dismissDialog(context);

  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => CustomDialogBuilder(
      state: state,
      message: message,
      onPressed: () => Navigator.pop(context),
    ),
  );
}

// This function make sure if a dialog is opened
bool _isCurrentDialogShowing(BuildContext context) =>
    ModalRoute.of(context)?.isCurrent != true;

// if a dialog is opened then close it
void dismissDialog(BuildContext context) {
  if (_isCurrentDialogShowing(context)) {
    Navigator.of(context, rootNavigator: true).pop(true);
  }
}

class CustomDialogBuilder extends StatelessWidget {
  const CustomDialogBuilder({
    Key? key,
    required this.state,
    required this.message,
    required this.onPressed,
  }) : super(key: key);
  final StateController state;
  final String message;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      elevation: 0.3,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: state == StateController.error
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Somthing Wrong',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    message,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      onPressed();
                    },
                    child: const Text('ok'),
                  ),
                ],
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                ],
              ),
      ),
    );
  }
}
