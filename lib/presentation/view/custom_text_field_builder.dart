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
    void Function(String)? onChanged,
    double borderRadius = 10.0,
    bool autofocus = false,
    TextAlign textAlign = TextAlign.start,
    TextInputAction textInputAction = TextInputAction.next,
  })  : _controller = controller,
        _hintText = hintText,
        _keyboardType = keyboardType,
        _borderRadius = borderRadius,
        _textInputAction = textInputAction,
        _onChanged = onChanged,
        _autofocus = autofocus,
        _textAlign = textAlign,
        super(key: key);

  final TextEditingController _controller;
  final String _hintText;
  final bool _autofocus;
  final TextInputType _keyboardType;
  final void Function(String)? _onChanged;
  final double _borderRadius;
  final TextInputAction _textInputAction;
  final TextAlign _textAlign;
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
        textAlign: _textAlign,
        autofocus: _autofocus,
        onChanged: _onChanged,
        textInputAction: _textInputAction,
        controller: _controller,
        keyboardType: _keyboardType,
        decoration: InputDecoration(
          hintText: _hintText,
        ),
      ),
    );
  }
}
