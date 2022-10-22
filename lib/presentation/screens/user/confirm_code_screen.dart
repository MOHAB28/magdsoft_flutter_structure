import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';

import '../../../business_logic/verify_phone_cubit/verify_phone_cubit.dart';
import '../../../constants/keys.dart';
import '../../../data/network/requests/verify_phone_request.dart';
import '../../router/app_router.dart';
import '../../view/custom_button_builder.dart';
import '../../view/custom_text_field_builder.dart';
import '../../../constants/strings_manager.dart';
import '../../services/notification_services.dart';
import '../../view/scaffold_background_builder.dart';
import '../../widget/dialog.dart';
import '../../widget/toast.dart';

class ConfirmCodeScreen extends StatefulWidget {
  final String code;
  final String phone;
  const ConfirmCodeScreen({
    Key? key,
    required this.code,
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
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: CustomTextFormFieldBuilder(
                        controller: _firstController,
                        autofocus: true,
                        textAlign: TextAlign.center,
                        onChanged: _onChanged,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Expanded(
                      child: CustomTextFormFieldBuilder(
                        controller: _sndController,
                        textAlign: TextAlign.center,
                        onChanged: _onChanged,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Expanded(
                      child: CustomTextFormFieldBuilder(
                        textAlign: TextAlign.center,
                        controller: _thController,
                        keyboardType: TextInputType.number,
                        onChanged: _onChanged,
                      ),
                    ),
                    Expanded(
                      child: CustomTextFormFieldBuilder(
                        onChanged: _onChanged,
                        textAlign: TextAlign.center,
                        controller: _foController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  child: const Text(AppStrings.resendCode),
                  onPressed: () async {
                    await Future.delayed(const Duration(seconds: 2));
                    _notifyUser();
                  },
                ),
                BlocListener<VerifyPhoneCubit, VerifyPhoneState>(
                  listener: (context, state) {
                    if (state is VerifyPhoneLoading) {
                      showMyDialog(
                        context: context,
                        state: StateController.loading,
                      );
                    } else if (state is VerifyPhoneFialure) {
                      showMyDialog(
                        context: context,
                        state: StateController.error,
                        message: state.message,
                      );
                    } else if (state is VerifyPhoneSuccess) {
                      dismissDialog(context);
                      WidgetsBinding.instance.addPostFrameCallback(
                        (_) => showToast(
                          state.data.message,
                          context,
                        ),
                      );
                      CacheHelper.saveDataSharedPreference(
                        key: isLoggedIn,
                        value: true,
                      ).then((value) {
                        if (value) {
                          Navigator.pushReplacementNamed(
                            context,
                            Routes.homeScreenKey,
                          );
                        }
                      });
                    }
                  },
                  child: CustomButtonBuilder(
                    onTap: () {
                      if (_firstController.text.isNotEmpty ||
                          _sndController.text.isNotEmpty ||
                          _thController.text.isNotEmpty ||
                          _foController.text.isNotEmpty) {
                        VerifyPhoneCubit.get(context).sendOtp(
                          VerifyPhoneRequest(
                            code: _firstController.text.trim() +
                                _sndController.text.trim() +
                                _thController.text.trim() +
                                _foController.text.trim(),
                            phone: widget.phone,
                          ),
                        );
                      }
                    },
                    title: AppStrings.verify,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _notifyUser() {
    notificationService.showNotifications(code: widget.code);
  }

  void _onChanged(String value) {
    if (value.length == 1) {
      FocusScope.of(context).nextFocus();
    }
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
