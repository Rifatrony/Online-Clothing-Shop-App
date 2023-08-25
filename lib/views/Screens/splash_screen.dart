import 'package:cloth_shop_app/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Transform.scale(
              scale: 1.5, // Adjust this value for the desired size increase
              child: Lottie.asset(
                'assets/animation/animation_1.json', // Replace with your animation file
                width: 200, // Set initial width
                height: 200,
                repeat: true, // Set to true for continuous animation
              ),
            ),

            const SizedBox(height:10,),

            Obx(() {
              if(Get.find<SplashController>().isLoading.value){
                return const CircularProgressIndicator();
              }
              else{
                return Container();
              }

            }),
          ],
        ),
      ),
    );
  }
}
