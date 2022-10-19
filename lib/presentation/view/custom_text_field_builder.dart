import 'package:flutter/material.dart';

class CustomTextFormFieldBuilder extends StatelessWidget {
  const CustomTextFormFieldBuilder({
    Key? key,
    required TextEditingController controller,
    required String hintText,
    TextInputType keyboardType = TextInputType.name,
    double borderRadius = 10.0
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
        borderRadius: BorderRadius.circular(_borderRadius)
      ),
      child: TextFormField(
        controller: _controller,
        keyboardType: _keyboardType,
        decoration: InputDecoration(
          hintText: _hintText,
        ),
      ),
    );
  }
}
