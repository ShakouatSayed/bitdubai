import 'package:bitdubai/controller/ProfileController.dart';
import 'package:bitdubai/controller/SendReceiveController.dart';
import 'package:bitdubai/utils/Style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget{
  final ProfileController controller = Get.put(ProfileController());
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: backgraoundColor,
      body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCustomAppbar(controller),
            ],
          ),
        )
    );
  }
  Widget _buildCustomAppbar(ProfileController controller){
    return Obx((){
      final user = controller.profile.value;
      if(user == null){
        return const Center(child: CircularProgressIndicator());
      }
      return Container(
        //color: Color(0xFF0A8ED9),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
          color: Color(0xFF0A8ED9),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Profile",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),

              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      );
    });
  }
}