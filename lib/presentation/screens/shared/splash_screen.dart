import 'dart:async';

import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/keys.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';

import '../../../constants/assets_manager.dart';
import '../../router/app_router.dart';
import '../../styles/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(const Duration(seconds: 2), _goNext);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: const Center(
        child: Image(
          image: AssetImage(ImageAssets.splashLogo),
        ),
      ),
    );
  }

  void _goNext() async {
    bool? isLogged =
        await CacheHelper.getDataFromSharedPreference(key: isLoggedIn);
    if (isLogged != null) {
      Navigator.pushReplacementNamed(context, Routes.homeScreenKey);
    } else {
      Navigator.pushReplacementNamed(context, Routes.loginScreenKey);
    }
  }
}
