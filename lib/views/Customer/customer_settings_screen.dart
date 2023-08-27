import 'package:cloth_shop_app/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/login_controller.dart';

class CustomerSettingsScreen extends StatelessWidget {
  const CustomerSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.find<LoginController>();
    String? token = controller.accessToken.value;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() =>
            Column(
              children: [
                ListTile(
                  onTap: (){

                  },
                  title: Text("Profile"),
                  leading: Icon(Icons.person_outline),
                  trailing: Icon(Icons.arrow_forward_ios, size: 20,),
                ),
                Divider(),
                ListTile(
                  onTap: (){

                  },
                  title: Text("Change Language"),
                  leading: Icon(Icons.translate),
                  trailing: Text("Switch"),
                ),
                Divider(),
                ListTile(
                  onTap: ()  {
                  },
                  title: Text("Change Theme"),
                  leading: Icon(Icons.person_outline),
                  trailing: Text("Switch")
                ),
                Divider(),
                ListTile(
                  onTap: (){

                  },
                  title: Text("Terms & Condition"),
                  leading: Icon(Icons.logout),
                  trailing: Icon(Icons.arrow_forward_ios, size: 20,),
                ),
                Divider(),
                ListTile(
                  onTap: (){

                  },
                  title: Text("Privacy & Policy"),
                  leading: Icon(Icons.logout),
                  trailing: Icon(Icons.arrow_forward_ios, size: 20,),
                ),
                Divider(),
                controller.accessToken.value != "" ? ListTile(
                  onTap: (){

                  },
                  title: Text("Change Password"),
                  leading: Icon(Icons.lock),
                  trailing: Icon(Icons.arrow_forward_ios, size: 20,),
                ) : Container(),
                controller.accessToken.value != "" ? Divider() : Container(),
                controller.accessToken.value != "" ? ListTile(
                  onTap: (){
                    Get.offAllNamed(RouteName.CUSTOMER_LOGIN_SCREEN);
                    controller.logout();
                  },
                  title: Text("Logout"),
                  leading: Icon(Icons.logout),
                  trailing: Icon(Icons.arrow_forward_ios, size: 20,),
                ) : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
