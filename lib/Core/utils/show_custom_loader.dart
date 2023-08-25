import 'package:flutter/material.dart';

class CustomLoader {
  void showLoader(BuildContext context){
    showDialog(context: context, builder: (context){
      return const Center(child: CircularProgressIndicator());
    });
  }
}
