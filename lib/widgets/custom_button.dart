import 'package:cloth_shop_app/Core/values/app_color.dart';
import 'package:flutter/material.dart';

import '../Core/values/constatnt_screen_size.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPress, required this.title, this.textColor = AppColor.whiteColor, this.isLoading = false , });
  final String title;
  final Color? textColor;
  final bool? isLoading;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        height: 50,
        decoration: BoxDecoration(
          color: AppColor.green,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: isLoading == true
              ? const CircularProgressIndicator()
              : Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                  ),
                )
        ),
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  final String title;
  VoidCallback onPress;
  final double? height;
  final double? width;
  final double? radius;
  final double? size;
  final Color? buttonColor;
  final Color? textColor;
  final bool? loading;

  AppButton({
    super.key,
    required this.onPress,
    required this.title,
    this.height = 50,
    this.width = double.maxFinite,
    this.radius = 20,
    this.size = 16,
    this.buttonColor = Colors.purple,
    this.textColor = Colors.white,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: ScreenSize.width16,
        right: ScreenSize.width16,
        top: ScreenSize.font20,
        bottom: ScreenSize.height16,
      ),
      child: InkWell(
        onTap: onPress,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius!),
            color: buttonColor,
          ),
          child: Center(
            child: loading == false? Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: size,
              ),
            ) : const CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
