import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Container(
            height: 40,
            width: 40,
            child: Image.asset("lib/icons/back2.png"),
          ),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        title: Text(
          "Login",
          style: GoogleFonts.inter(
            color: Colors.black87,
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
            letterSpacing: 0,
          ),
        ),
        toolbarHeight: 110,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(height: 40),
            //Text field Login import from Auth_text_field widget
            AuthTextField(
                text: "Enter your email", icon: "lib/icons/email.png"),
            SizedBox(height: 5),
            //Text field Password
            AuthTextField(
                text: "Enter your password", icon: "lib/icons/lock.png"),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/forgot_password');
                  },
                  child: Text(
                    "Forgot your password?",
                    style: GoogleFonts.poppins(
                      fontSize: 15.sp,
                      color: const Color.fromARGB(255, 3, 190, 150),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              width: 90.w,
              child: ElevatedButton(
                onPressed: () {
                  // Perform verification or other actions here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 3, 190, 150),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    Get.offNamed('/home');
                  },
                  child: Text(
                    "Login",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: GoogleFonts.poppins(
                      fontSize: 15.sp, color: Colors.black87),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/register');
                  },
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.poppins(
                      fontSize: 15.sp,
                      color: const Color.fromARGB(255, 3, 190, 150),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "or",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(child: Divider()),
              ],
            ),
            SizedBox(height: 30),
            AuthSocialLogins(
                logo: "images/google.png", text: "Sign in with Google"),
            SizedBox(height: 20),
            AuthSocialLogins(logo: "images/apple.png", text: "Sign in Apple"),
            SizedBox(height: 20),
            AuthSocialLogins(
                logo: "images/facebook.png", text: "Sign in Facebook"),
          ],
        ),
      ),
    );
  }
}

class AuthTextField extends StatelessWidget {
  final String text;
  final String icon;

  const AuthTextField({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: text,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(icon),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}

class AuthSocialLogins extends StatelessWidget {
  final String logo;
  final String text;

  const AuthSocialLogins({
    Key? key,
    required this.logo,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Perform actions for social logins
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            logo,
            height: 40,
            width: 40,
          ),
          SizedBox(width: 10),
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 15.sp,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
