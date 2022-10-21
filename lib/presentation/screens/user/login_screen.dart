import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/login_cubit/login_cubit.dart';
import '../../../constants/assets_manager.dart';
import '../../../constants/strings_manager.dart';
import '../../../data/network/requests/login_request.dart';
import '../../router/app_router.dart';
import '../../styles/colors.dart';
import '../../view/custom_button_builder.dart';
import '../../view/custom_text_field_builder.dart';
import '../../widget/dialog.dart';
import '../../widget/toast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            // Top Image
            const Image(image: AssetImage(ImageAssets.loginBackground)),
            const Align(
              alignment: Alignment.bottomCenter,
              child: BottomContainer(),
            ),
            Align(
              alignment: Alignment.center,
              child: Card(
                margin: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  bottom: 100.0,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 44.0,
                    vertical: 25.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.welcome,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 15.0),
                      const CustomDivider(),
                      const SizedBox(height: 40.0),
                      CustomTextFormFieldBuilder(
                        controller: _nameController,
                        hintText: AppStrings.nameHintText,
                      ),
                      const SizedBox(height: 15.0),
                      CustomTextFormFieldBuilder(
                        controller: _phoneController,
                        hintText: AppStrings.phoneHintText,
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 40.0),
                      BlocListener<LoginCubit, LoginState>(
                        listener: (context, state) {
                          if (state is LoginLoadingState) {
                            showMyDialog(
                              context: context,
                              state: StateController.loading,
                            );
                          } else if (state is LoginFailureState) {
                            showMyDialog(
                              context: context,
                              state: StateController.error,
                              message: state.message,
                            );
                          } else if (state is LoginSucessState) {
                            dismissDialog(context);
                            showToast(state.data.message);
                            Navigator.pushReplacementNamed(
                              context,
                              Routes.confirmCodeScreenKey,
                            );
                          }
                        },
                        child: CustomButtonBuilder(
                          title: AppStrings.login,
                          onTap: () {
                            if (_nameController.text.trim().isEmpty ||
                                _phoneController.text.trim().isEmpty) {
                              showToast('Please, Fill your data!');
                            } else {
                              LoginCubit.get(context).login(
                                LoginRequest(
                                  name: _nameController.text.trim(),
                                  phone: _phoneController.text.trim(),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _nameController.dispose();
    super.dispose();
  }
}

class BottomContainer extends StatelessWidget {
  const BottomContainer({
    Key? key,
  }) : super(key: key);

  final List<String> _images = const [
    ImageAssets.facebook,
    ImageAssets.ios,
    ImageAssets.google,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63.h,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(60),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Spacer(),
            const Spacer(),
            const Spacer(),
            const Spacer(),
            Row(
              children: [
                const Expanded(
                  child: Divider(
                    color: AppColors.blue,
                    endIndent: 5,
                    indent: 20,
                  ),
                ),
                Text(
                  AppStrings.or,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                const Expanded(
                  child: Divider(
                    color: AppColors.blue,
                    indent: 5,
                    endIndent: 20,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _images
                    .map(
                      (e) => SizedBox(
                        height: 50,
                        width: 50,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Image(
                                image: AssetImage(e),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3.0,
      width: 143.0,
      decoration: BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.circular(50.0),
      ),
    );
  }
}
