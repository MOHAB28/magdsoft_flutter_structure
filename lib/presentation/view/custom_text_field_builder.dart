import 'package:flutter/material.dart';
import '../../constants/font_manager.dart';
import '../styles/colors.dart';
import '../styles/text_style.dart';

class CustomTextFormFieldBuilder extends StatelessWidget {
  const CustomTextFormFieldBuilder({
    Key? key,
    required TextEditingController controller,
    String hintText = '',
    TextInputType keyboardType = TextInputType.name,
    double borderRadius = 10.0,
  })  : _controller = controller,
        _hintText = hintText,
        _keyboardType = keyboardType,
        _borderRadius = borderRadius,
        super(key: key);

  final TextEditingController _controller;
  final String _hintText;
  final TextInputType _keyboardType;
  final double _borderRadius;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
      child: TextFormField(
        style: getRegularStyle(
          color: AppColors.black,
          fontSize: FontSize.s16,
        ),
        controller: _controller,
        keyboardType: _keyboardType,
        decoration: InputDecoration(
          hintText: _hintText,
        ),
      ),
    );
  }
}
