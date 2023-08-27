import 'package:cloth_shop_app/Core/values/app_color.dart';
import 'package:cloth_shop_app/controller/login_controller.dart';
import 'package:cloth_shop_app/routes/route_name.dart';
import 'package:cloth_shop_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';

import 'customer_dashboard_screen.dart';

class CustomerLoginScreen extends GetView<LoginController> {
  const CustomerLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.find();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100,),
            CircleAvatar(
              backgroundColor: AppColor.green,
              radius: 50,
              child: Text("Logo\nhere", style: TextStyle(color: AppColor.whiteColor),),
            ),
            Card(
              elevation: 10,
              color: Colors.blueGrey.shade50,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20,),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
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
                    CustomTextFormField(
                      controller: controller.emailOrPhoneController,
                      label: "Email/Phone number",
                      inputType: TextInputType.phone,
                    ),

                    Obx(() => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8,),
                      child: TextFormField(
                        controller: controller.passwordController,
                        obscureText: controller.isPasswordHidden.value,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            isDense: true,
                            label: Text("Password"),
                            suffixIcon: InkWell(
                              onTap: (){
                                controller.isPasswordHidden.value =! controller.isPasswordHidden.value;
                              },
                              child: Icon(controller.isPasswordHidden.value ? Icons.visibility_off : Icons.visibility),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                        ),
                      ),
                    ),),
                    // CustomTextFormField(
                    //   isObsecure: true,
                    //   controller: controller.passwordController,
                    //   label: "Password",
                    // ),
                    Obx(() => AppButton(
                      loading: controller.isLoading.value,
                      onPress: (){
                        controller.loginUser();
                      },
                      title: "Login",
                    ),),

                    // Forget password section
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10,),
                      child: Text(
                        "Forget Password",
                        textAlign: TextAlign.right,
                        style: GoogleFonts.lato(
                          fontSize: 14,
                        ),
                      ),
                    ),

                    // No account section
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(RouteName.CUSTOMER_REGISTRATION_SCREEN);
                      },
                      child: Text.rich(
                          TextSpan(
                              text: 'No account yet ? ',
                              style: GoogleFonts.lato(
                                fontSize: 14,
                              ),
                              children: [
                                TextSpan(
                                  text: ' Register here',
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
          ],
        ),
      ),
    );
  }
}
