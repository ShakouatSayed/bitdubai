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
              _buildAccountSection(),
              // Preferences Sections
              _buildPreferencesSection(),
              _buildSupportSection(),
              _buildLanguageSections(),
              _buildOtherSection(),
              SizedBox(height: 30)


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
              child: Column(
                children:[
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //crossAxisAlignment: CrossAxisAlignment.start,
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
                        ],
                    ))
                  ],
                ),
                  Divider(color: Colors.white38),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Member since", style: TextStyle(color: Colors.white70)),
                      Text(user.memberSince, style: TextStyle(color: Colors.white70)),
                    ],
                  )
                ],
              ),
            ),

          ],
        ),
      );
    });
  }

  Widget _buildAccountSection(){
    return Obx((){
      final user = controller.profile.value;
      if(user == null){
        return Center(child: CircularProgressIndicator());
      }
      return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Account", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 10),

            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    )
                  ]
              ),
              child: Column(
                children: [
                  _buildTile(icon: Icons.verified_user, title: "KYC Verification", trailing: user.kycVerified? _verifiedTag() : Text("Not Verified")),
                  Divider(height: 1,color: Colors.grey),
                  _buildTile(icon: Icons.lock_outline, title: "Change Password", trailing: Icon(Icons.arrow_forward_ios, size: 16)),
                  Divider(height: 2, color: Colors.grey),
                  _buildTile(icon: Icons.notifications_outlined, title: "Notifications", trailing: Switch(value: true, onChanged: (val){}, activeTrackColor: Colors.blue,activeThumbColor: Colors.white)),
                  SizedBox(height: 10),
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  // Preferences Sections
  Widget _buildPreferencesSection(){
    return Obx((){
      final user = controller.profile.value;
      if(user == null){
        return Center(child: CircularProgressIndicator());
      }
      return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Preferences", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 10),

            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    )
                  ]
              ),
              child: Column(
                children: [
                  _buildTile(icon: Icons.flag_circle_outlined, title: "Language", subtitle: "English", trailing: Icon(Icons.arrow_forward_ios, size: 16)),
                  Divider(height: 1,color: Colors.grey),
                  _buildTile(icon: Icons.dark_mode_outlined, title: "Dark Mode", trailing: Switch(value: true, onChanged: (val){}, activeTrackColor: Colors.blue,activeThumbColor: Colors.white)),
                  SizedBox(height: 10),
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  // Support Section
  Widget _buildSupportSection(){
    return Obx((){
      final user = controller.profile.value;
      if(user == null){
        return Center(child: CircularProgressIndicator());
      }
      return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Support", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 10),

            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    )
                  ]
              ),
              child: Column(
                children: [
                  _buildTile(icon: Icons.headphones, title: "Help Center",  trailing: Icon(Icons.arrow_forward_ios, size: 16)),
                  Divider(height: 1,color: Colors.grey),
                  _buildTile(icon: Icons.headphones, title: "Contact Us", trailing: Icon(Icons.arrow_forward_ios, size: 16)),
                  SizedBox(height: 10),
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  // Language Section
  Widget _buildLanguageSections(){
    return Obx((){
      final user = controller.profile.value;
      if(user == null){
        return Center(child: CircularProgressIndicator());
      }
      return Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                )
              ]
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.language, size: 12),
                        SizedBox(width: 10),
                        Text("Language", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Colors.black)),
                      ],
                    ),
                    Text("English", style: TextStyle(fontSize: 15, color: Colors.grey)),
                  ],
                ),
                SizedBox(height: 20),
                Row(children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => controller.selectedLanguage.value = "English",
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: controller.selectedLanguage.value == "English" ? Colors.blue : Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text("English", style: TextStyle(color: controller.selectedLanguage.value == "English" ? Colors.white : Colors.black87, fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => controller.selectedLanguage.value == "Arabic",
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: controller.selectedLanguage.value == "Arabic" ? Colors.blue : Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text("العربية", style: TextStyle(color: controller.selectedLanguage == "Arabic" ? Colors.white : Colors.black87, fontWeight: FontWeight.w600, fontFamily: "Arial")),
                        ),
                      ),
                    ),
                  )
                ],),
              ],
            ),
          ),
        )


      );
    });
  }

  // Other Section
  Widget _buildOtherSection(){
    return Padding(
      padding: EdgeInsets.all(20),
      child: Center(
        child: Column(
          children: [
            Text("BitDubai v1.0.0", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 15)),
            SizedBox(height: 10),
            Text("Licensed & Regulated in UAE", style: TextStyle(color: Colors.grey, fontSize: 15)),
            SizedBox(height: 15),
            
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(
                  color: Colors.red
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      
              ), onPressed: (){},icon: Icon(Icons.logout, color: Colors.red,), label: Text("Logout", style: TextStyle(color: Colors.red, fontSize: 15, fontWeight: FontWeight.w600))),
            )
            
            
          ],
        ),
      ),
    );
  }

  Widget _buildTile({required IconData icon, required String title, Widget? trailing, String? subtitle}){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        //border: Border.all(color: Colors.grey)
      ),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            shape: BoxShape.circle
          ),
          child: Icon(icon, color: Colors.blue),
        ),
        title: Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
        subtitle: subtitle != null ? Text(subtitle) : null,
        trailing: trailing,
        contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 2),
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
      child: Row( mainAxisSize: MainAxisSize.min, children:[
        Icon(Icons.check_circle_outline, size: 12),
        SizedBox(width: 5),
        Text("Verified", style: TextStyle(color: Colors.green, fontSize: 12)),
      ]),
    );
  }
}