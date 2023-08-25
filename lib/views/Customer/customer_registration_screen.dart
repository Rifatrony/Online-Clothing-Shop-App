import 'package:cloth_shop_app/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Core/values/app_color.dart';
import '../../routes/route_name.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';

class CustomerRegistrationScreen extends StatelessWidget {
  const CustomerRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.find();
    return Scaffold(
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Obx(() {
      //       return Container(
      //         margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      //         height: 50,
      //         width: double.infinity,
      //         decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(16),
      //             color: Colors.teal
      //         ),
      //         child: Center(child: Text(controller.a.toString())),
      //       );
      //     }),
      //
      //     Obx(() {
      //       return Container(
      //         margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      //         height: 50,
      //         width: double.infinity,
      //         decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(16),
      //             color: Colors.teal
      //         ),
      //         child: Center(child: Text("A after decrement "+controller.a.toString())),
      //       );
      //     }),
      //
      //     GestureDetector(
      //       onTap: (){
      //         Get.find<LoginController>().decrementA();
      //         // Get.toNamed(RouteName.CUSTOMER_LOGIN_SCREEN);
      //       },
      //       child: Container(
      //         margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      //         height: 50,
      //         width: double.infinity,
      //         decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(16),
      //             color: Colors.teal
      //         ),
      //         child: const Center(child: Text("Decrement A")),
      //       ),
      //     ),
      //
      //     GestureDetector(
      //       onTap: (){
      //         // Get.find<LoginController>().incrementA();
      //         Get.toNamed(RouteName.CUSTOMER_LOGIN_SCREEN);
      //       },
      //       child: Container(
      //         margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      //         height: 50,
      //         width: double.infinity,
      //         decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(16),
      //             color: Colors.teal
      //         ),
      //         child: const Center(child: Text("Go to First Page")),
      //       ),
      //     ),
      //   ],
      // ),

      body: Center(
        child: Card(
          elevation: 6,
          color: Colors.blueGrey.shade50,
          margin: const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 20,),
          child: Padding(
            padding: const EdgeInsets.symmetric( horizontal: 20.0, vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Login", style: GoogleFonts.lato(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                ),
                const SizedBox(height: 20,),
                CustomTextFormField(controller: controller.emailOrPhoneController, label: "Name"),
                CustomTextFormField(controller: controller.emailOrPhoneController, label: "Phone number"),
                CustomTextFormField(controller: controller.emailOrPhoneController, label: "Email"),
                CustomTextFormField(isObsecure: true, controller: controller.passwordController, label: "Password"),
                CustomTextFormField(isObsecure: true, controller: controller.passwordController, label: "Confirm Password"),
                CustomButton(
                  onPress: (){

                  },
                  title: "login",
                ),

                // Forget password section
                // Container(
                //   width: double.infinity,
                //   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10,),
                //   child: Text(
                //     "Forget Password",
                //     textAlign: TextAlign.right,
                //     style: GoogleFonts.lato(
                //       fontSize: 14,
                //     ),
                //   ),
                // ),

                SizedBox(height: 10,),

                // No account section
                GestureDetector(
                  onTap: (){
                    Get.toNamed(RouteName.CUSTOMER_LOGIN_SCREEN);
                  },
                  child: Text.rich(
                      TextSpan(
                          text: 'Already have account ? ',
                          style: GoogleFonts.lato(
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(
                              text: ' Login here',
                              style: GoogleFonts.lato(
                                fontSize: 14,
                                color: AppColor.green,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ]
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
