import 'package:flutter/material.dart';

import '../styles/colors.dart';

class ScaffoldBackGroundBuilder extends StatelessWidget {
  const ScaffoldBackGroundBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0,0.5],
          colors: AppColors.scaffoldGradientBackground,
        ),
      ),
    );
  }
}
