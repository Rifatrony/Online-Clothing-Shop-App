import 'package:flutter/material.dart';

import '../Core/values/constatnt_screen_size.dart';

class ShadowTextForm extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool? isVisible;
  final String? Function(String?) validator;

  const ShadowTextForm({
    super.key,
    required this.hint,
    required this.controller,
    required this.inputType,
    this.isVisible = false,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: ScreenSize.width5, right: ScreenSize.width5, bottom: ScreenSize.height16),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(8, 5), // changes the position of the shadow
            ),
          ],
        ),
        child: TextFormField(
          obscureText: isVisible!,
          keyboardType: inputType,
          controller: controller,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(
              left: ScreenSize.width16,
              right: ScreenSize.width16,
              top: ScreenSize.height10,
              bottom: ScreenSize.height10,
            ),
            hintText: hint,
          ),
          validator: validator,
        ),
      ),
    );
  }
}