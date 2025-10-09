import 'package:bitdubai/utils/Style.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _nameCtr1 = TextEditingController();
  final _emailCtr1 = TextEditingController();
  final _phoneCtr1 = TextEditingController();
  final _pwdCtr1 = TextEditingController();
  bool _agree = false;
  bool _obscure = true;

  @override
  void dispose() {
    _nameCtr1.dispose();
    _emailCtr1.dispose();
    _phoneCtr1.dispose();
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
              children: [
                SizedBox(height: 25),
                // top icon
                Container(
                  width: 68,
                  height: 68,
                  decoration: BoxDecoration(
                    color: Color(0xFFE8F9F0),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.person_outline,
                      color: Color(0xFF21C997),
                      size: 30,
                    ),
                  ),
                ),
                SizedBox(height: 18),
        
                // top title
                Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8),
        
                // Get started text
                Text(
                  "Get Started",
                  style: TextStyle(fontSize: 16, color: Color(0xFF7C8AA5)),
                ),
                SizedBox(height: 22),
        
                // Full Name
                Text(
                  "Full Name",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 8),
        
                // name form filed
                TextFormField(
                  controller: _nameCtr1,
                  decoration: buildDecoration(
                    hint: "John Doe",
                    prefix: Icons.person_outline,
                  ),
                ),
                SizedBox(height: 14),
        
                // Email from filed
                Text(
                  "Email",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _emailCtr1,
                  keyboardType: TextInputType.emailAddress,
                  decoration: buildDecoration(
                    hint: "your@email.com",
                    prefix: Icons.mail_outline,
                  ),
                ),
                SizedBox(height: 14),
        
                // Phone from filed
                Text(
                  "Phone",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _phoneCtr1,
                  keyboardType: TextInputType.phone,
                  decoration: buildDecoration(
                    hint: "+971 50 123 4567",
                    prefix: Icons.phone_outlined,
                  ),
                ),
                SizedBox(height: 14),
        
                // Password from filed
                Text(
                  "Password",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _pwdCtr1,
                  obscureText: _obscure,
                  decoration: buildDecoration(
                    hint: "***********",
                    prefix: Icons.lock_outline,
                    suffix: IconButton(
                      onPressed: () => setState(() => _obscure = !_obscure),
                      icon: Icon(
                        _obscure
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
        
                // Terms checkbox
                Row(
                  children: [
                    Checkbox(
                      value: _agree,
                      onChanged: (v) => setState(() => _agree == v ?? false),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      activeColor: Color(0xFF21C997),
                    ),
                    SizedBox(width: 5),
        
                    // agree text
                    Expanded(
                      child: Text(
                        "I agree to Terms & conditions",
                        style: TextStyle(color: Color(0xFF7C8AA5)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
        
                // Sign Up button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _agree
                        ? () => ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Sign Up: ${_emailCtr1.text}"),
                            ),
                          )
                        : null,
                    style: ElevatedButton.styleFrom(),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 18,
                        color: _agree ? Colors.white : Color(0xFF9AB9A8),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
        
                // Login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?", style: TextStyle(color: Color(0xFF7C8AA5))),
                    SizedBox(width: 5),
                    TextButton(onPressed: () {} /*Navigator.push(context, MaterialPageRoute(builder: (context) => )) */, child: Text("Login", style: TextStyle(color: primaryBlue))),
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
