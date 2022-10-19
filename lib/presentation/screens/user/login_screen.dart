import 'package:flutter/material.dart';

import '../../../constants/assets_manager.dart';
import '../../../constants/strings_manager.dart';
import '../../styles/colors.dart';
import '../../view/custom_text_field_builder.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            const Image(image: AssetImage(ImageAssets.loginBackground)),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height / 1.5,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 30),
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
