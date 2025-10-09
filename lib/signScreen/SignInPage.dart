import 'package:bitdubai/utils/Style.dart';
import 'package:flutter/material.dart';

import 'SignUpPage.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailCtr1 = TextEditingController();
  final _pwdCtr1 = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _emailCtr1.dispose();
    _pwdCtr1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgraoundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 25),
                // icon box + title & subtitle (left aligned)
                Container(
                  width: 68,
                  height: 68,
                  decoration: BoxDecoration(
                    color: Color(0xFFE7F0FB),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.attach_money_outlined,
                      color: primaryBlue,
                      size: 30,
                    ),
                  ),
                ),
                SizedBox(height: 18),
        
                // Login text
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8),
        
                Text(
                  "Welcome to BitDubai",
                  style: TextStyle(fontSize: 16, color: Color(0xFF7C8AA5)),
                ),
                SizedBox(height: 26),
        
                // Email label + field
                Text(
                  "Email",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 8),
        
                // Text from field
                TextFormField(
                  controller: _emailCtr1,
                  keyboardType: TextInputType.emailAddress,
                  decoration: buildDecoration(
                    hint: "your@email.com",
                    prefix: Icons.mail_outline,
                  ),
                ),
                SizedBox(height: 16),
        
                // Password label + field
                Text(
                  "Password",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 8),
        
                // Password field
                TextFormField(
                  controller: _pwdCtr1,
                  obscureText: _obscure,
                  decoration: buildDecoration(
                    hint: "**********",
                    prefix: Icons.lock_outline,
                    suffix: IconButton(
                      onPressed: () {
                        setState(() => _obscure = !_obscure);
                      },
                      icon: Icon(
                        _obscure
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Color(0xFF7C8AA5),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
        
                // Forgot password align right
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Forget password")),
                      );
                    },
                    child: Text(
                      "Forget Password",
                      style: TextStyle(color: primaryBlue),
                    ),
                  ),
                ),
                // Spacer(),
                SizedBox(height: 40),
        
                // Big Login button
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 4,
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 14),
        
                // Sign up prompt
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Check have an account
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Color(0xFF7C8AA5)),
                    ),
                    SizedBox(width: 5),
        
                    // Sign up text button
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: primaryBlue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
