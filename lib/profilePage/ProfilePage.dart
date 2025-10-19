import 'package:bitdubai/controller/ProfileController.dart';
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
      body: Obx((){
        final user = controller.profile.value;
        if(user == null){
          return Center(child: CircularProgressIndicator());
        }
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCustomAppbar(),
              SizedBox(height: 30),

              // Account Section
              Text("Account", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              SizedBox(height: 10),

              _buildTile(icon: Icons.verified_user, title: "KYC Verification", trailing: user.kycVerified? _verifiedTag() : Text("Not Verified")),
              _buildTile(icon: Icons.lock_outline, title: "Change Password", trailing: Icon(Icons.arrow_forward_ios, size: 16)),
              SwitchListTile(value: true, onChanged: (_){}, activeTrackColor: Colors.blue, title: Text("Notifications"), secondary: Icon(Icons.notifications_outlined)),
              SizedBox(height: 10),

              // Preferences Sections

            ],
          ),
        );
      })
    );
  }
  Widget _buildCustomAppbar(){
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
            Text(
              "Profile",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color:Color(0xFF4D9FD3),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.orangeAccent,
                    child: Text(user.name.split(" ")[0][0] + user.name.split(" ")[1][0], style: TextStyle(color: Colors.white24, fontSize: 20))
                  ),
                  SizedBox(width: 15),
                  Expanded(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(user.name, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                          Text(user.email, style: TextStyle(color: Colors.white70)),
                          Text(user.phone, style: TextStyle(color: Colors.white70)),
                          Divider(color: Colors.white38),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Member since", style: TextStyle(color: Colors.white70)),
                              Text(user.memberSince, style: TextStyle(color: Colors.white70)),
                            ],
                          )
                      ],
                  ))
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildTile({required IconData icon, required String title, Widget? trailing, String? subtitle}){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        subtitle: subtitle != null ? Text(subtitle) : null,
        trailing: trailing,
      ),
    );
}

  Widget _verifiedTag(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.green.shade100,
      ),
      child: Text("Verified", style: TextStyle(color: Colors.green, fontSize: 12)),
    );
  }
}