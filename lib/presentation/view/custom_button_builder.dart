import 'package:flutter/material.dart';

import '../styles/colors.dart';

// Reusable component for a gradient buttonn
class CustomButtonBuilder extends StatelessWidget {
  const CustomButtonBuilder({
    Key? key,
    required String title,
    required VoidCallback onTap,
    double height = 50.0,
    double borderRadius = 50.0,
    List<Color> gradientColor = AppColors.buttunGradientBackground,
  })  : _title = title,
        _height = height,
        _borderRadius = borderRadius,
        _gradientColor = gradientColor,
        _onTap = onTap,
        super(key: key);

  final String _title;
  final double _height;
  final double _borderRadius;
  final List<Color> _gradientColor;
  final VoidCallback _onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onTap();
      },
      child: Container(
        height: _height,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_borderRadius),
          gradient: LinearGradient(
            stops: const [0.4, 1, 1],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: _gradientColor.reversed.toList(),
            tileMode: TileMode.clamp,
          ),
        ),
        child: Center(
          child: Text(
            _title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
