import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloth_shop_app/Core/values/constatnt_screen_size.dart';
import 'package:cloth_shop_app/controller/Customer/OrderController.dart';
import 'package:cloth_shop_app/widgets/shadow_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/Customer/cart_controller.dart';

class CustomerCheckoutScreen extends StatefulWidget {
  const CustomerCheckoutScreen({super.key});

  @override
  State<CustomerCheckoutScreen> createState() => _CustomerCheckoutScreenState();
}

class _CustomerCheckoutScreenState extends State<CustomerCheckoutScreen> {
  @override
  Widget build(BuildContext context) {

    OrderController orderController = Get.find();
    CartController cartController = Get.find();

    List<Step> stepList()=> [
      Step(
        state: orderController.activeStepIndex.value > 0 ? StepState.complete : StepState.indexed,
        isActive: orderController.activeStepIndex.value >=0,
        title: Text("Address"),
        content: Form(
          key: orderController.formKey,
          child: Center(
            child: Column(
              children: [
                ShadowTextForm(
                  hint: "Name",
                  controller: orderController.nameController,
                  inputType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    }
                  return null;
                  },
                ),
                ShadowTextForm(
                  hint: "Phone",
                  controller: orderController.phoneController,
                  inputType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone is required';
                    }
                  return null;
                  },
                ),
                ShadowTextForm(
                  hint: "Email",
                  controller: orderController.emailController,
                  inputType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                  return null;
                  },
                ),
                ShadowTextForm(
                  hint: "Address",
                  controller: orderController.addressController,
                  inputType: TextInputType.streetAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Address is required';
                    }
                  return null;
                  },
                ),
              ],
            )
          ),
        ),
      ),
      Step(
        state: orderController.activeStepIndex.value > 1 ? StepState.complete : StepState.indexed,
        isActive: orderController.activeStepIndex.value >=1,
        title: const Text("Payment"),
        content: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Select Delivery Charge",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: ScreenSize.height15,),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: DropdownButton(
                  isExpanded: true,
                  underline: const SizedBox(),
                  hint: const Text("Select Delivery Method"),
                  value: orderController.selectedCategory,
                  items: orderController.deliveryList!
                      .map((delivery) => DropdownMenuItem(
                    value: delivery,
                    child: Row(
                      children: [
                        Text(
                          delivery.deliveryAddress.toString(),
                        ),
                        SizedBox(width: ScreenSize.width10,),
                        Text(
                          "${delivery.deliveryCharge} Tk",
                        ),
                      ],
                    ),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      orderController.selectedCategory = value;
                      orderController.selectedItemId.value = value!.datumId.toString();
                      orderController.deliveryCharge.value = value.deliveryCharge.toString();
                    });
                    print(value!.datumId.toString());
                    print("====================${orderController.selectedItemId.value}======================");
                  },
                ),
              ),
              SizedBox(height: ScreenSize.height15,),
              const Text(
                "Select Payment Type",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: ScreenSize.height15,),
              customRadio(
                "Cash on Delivery",
                1,
              ),
              customRadio(
                "Stripe",
                2,
              ),
              SizedBox(height: ScreenSize.height25,),
            ],
          ),
        ),
      ),
      Step(
        state: orderController.activeStepIndex.value > 2 ? StepState.complete : StepState.indexed,
        isActive: orderController.activeStepIndex.value >=2,
        title: Text("Confirm"),
        content: Center(
          child:  Column(
            children: [

              Card(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: ScreenSize.width10, vertical: ScreenSize.height10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only( bottom: ScreenSize.height5),
                        child: const Text(
                          "User details",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TitleAndRow(title: "Name", value: orderController.nameController.text.toString().trim()),
                      TitleAndRow(title: "Phone", value: orderController.phoneController.text.toString().trim()),
                      TitleAndRow(title: "Email", value: orderController.emailController.text.toString().trim()),
                      TitleAndRow(title: "Address", value: orderController.addressController.text.toString().trim()),
                    ],
                  ),
                ),
              ),

              SizedBox(height: ScreenSize.height10,),

              Card(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: ScreenSize.width10, vertical: ScreenSize.height10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only( bottom: ScreenSize.height5),
                        child: const Text(
                          "Payment details",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TitleAndRow(title: "Delivery Charge", value: orderController.selectedCategory!.deliveryCharge.toString() ),
                      TitleAndRow(title: "Delivery Address", value: orderController.selectedCategory!.deliveryAddress.toString()),
                      TitleAndRow(title: "Payment type", value: orderController.selectedIndex == 1 ? "Cash on Delivery" : "Stripe"),

                    ],
                  ),
                ),
              ),

              SizedBox(height: ScreenSize.height10,),

              FutureBuilder<List<Map<String, dynamic>>>(
                future: cartController.getCartItems(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final cartItems = snapshot.data!;
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 16, top: 10),
                            child: const Text(
                              "Products",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          ListView.builder(
                            padding: EdgeInsets.only(bottom: ScreenSize.height15),
                            itemCount: cartItems.length,
                            shrinkWrap: true,
                            primary: false,
                            itemBuilder: (context, index) {
                              final item = cartItems[index];
                              return Container(
                                margin: EdgeInsets.only(left: 10, top: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      "${index + 1}.",
                                      style: GoogleFonts.lato(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(width: ScreenSize.width10,),
                                    Text(
                                      item['name'].toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.lato(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      )
                    );
                  }
                },
              ),

              SizedBox(height: ScreenSize.height50,),
            ],
          ),
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
      ),
      body: Obx(()=>
      orderController.isCompleted.value
          ? Container(
              child: Center(
                child: TextButton(
                    onPressed: (){
                      orderController.isCompleted.value = false;
                      orderController.activeStepIndex.value = 0;
                    },
                    child: const Text(
                      "Go Back",
                    ),
                ),
              ),
            )
          : Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Colors.red,
                )
              ),
              child: Stepper(
                elevation: 4,
                currentStep: orderController.activeStepIndex.value,
                type: StepperType.horizontal,
                steps: stepList(),
                onStepContinue: (){
                  final lastStep = orderController.activeStepIndex.value == stepList().length - 1;
                  if(lastStep) {
                    orderController.isCompleted.value = true;
                    orderController.nameController.clear();
                    orderController.phoneController.clear();
                    orderController.emailController.clear();
                    orderController.addressController.clear();
                  }
                  else{
                    // For first index
                    if(orderController.activeStepIndex.value == 0){
                      // Validate first form
                      if (orderController.formKey.currentState!.validate()) {
                        // Proceed to the next step
                        orderController.activeStepIndex.value += 1;
                      }
                      else{
                        Get.snackbar("Warning", "All field is required");
                      }
                    }

                  // For second index
                  else if(orderController.activeStepIndex.value == 1){
                    // Validate second form
                    if(orderController.selectedItemId.isEmpty ){
                      print("===================Select delivery method =====================");
                      Get.snackbar("Warning", "Please select delivery method");
                    }
                    else{

                      if(orderController.selectedIndex.value == 1){
                        /// All ok go to next step
                        orderController.activeStepIndex.value += 1;
                        print("Select COD");
                      }
                      else if(orderController.selectedIndex.value == 2){
                        /// Open payment method if all ok go to next step
                        // orderController.activeStepIndex.value += 1;
                        print("Select Stripe and open form");
                        Get.snackbar("Message", "Open payment method");
                      }
                      else{
                        Get.snackbar("Warning", "Please select payment method");

                      }
                      // print("===========Go to next==============");
                      // orderController.activeStepIndex.value += 1;
                      // print("Payment method is ===============> ${orderController.selectedIndex.value}");
                      print("Delivery method is ===============> ${orderController.selectedCategory!.deliveryAddress.toString()}");

                    }
                  }
                  else {
                    // Validate third form
                  }
                  // if (orderController.formKey.currentState!.validate()) {
                  //   // Proceed to the next step
                  //   orderController.activeStepIndex.value += 1;
                  // }
                  // orderController.activeStepIndex.value += 1;
              }
            },
            // onStepTapped: (step) => orderController.activeStepIndex.value = step,
            onStepCancel: (){
              orderController.activeStepIndex.value == 0 ? null :
              orderController.activeStepIndex.value -= 1;
            },
            controlsBuilder: (BuildContext context, ControlsDetails controlsDetails) {
              final lastStep = orderController.activeStepIndex.value == stepList().length - 1;
              // Build and return your custom controls widget based on controlsDetails
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  if(orderController.activeStepIndex.value != 0)
                    Expanded(
                      child: ElevatedButton(
                        onPressed: controlsDetails.onStepCancel,
                        child: const Text('Back'),
                      ),
                    ),
                  SizedBox(width: ScreenSize.width10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: controlsDetails.onStepContinue,
                      child: Text(lastStep ? 'Confirm' : 'Next'),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget customRadio(String text, int index){
    OrderController controller = Get.find();
    return Obx(()=>
      OutlinedButton(
        onPressed: (){
          controller.selectedIndex.value = index;
        },
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: BorderSide(
            width: 2, // Border width
            color: controller.selectedIndex.value == index
                ? Colors.green
                : Colors.blueGrey,// Border color
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: controller.selectedIndex.value == index
                ? Colors.green
                : Colors.blueGrey,
          ),
        ),

      ),
    );
  }
}

class TitleAndRow extends StatelessWidget {
  const TitleAndRow({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
              child: Text(title)
          ),

          Expanded(
            flex: 5,
            child: Text(
              value,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}



