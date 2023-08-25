import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.controller, required this.label, this.inputType = TextInputType.name, this.isObsecure = false});

  final TextEditingController controller;
  final String label;
  final TextInputType? inputType;
  final bool isObsecure;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8,),
      child: TextFormField(
        controller: controller,
        obscureText: isObsecure,
        keyboardType: inputType,
        decoration: InputDecoration(
          isDense: true,
          label: Text(label),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )
        ),

      ),
    );
  }
}
