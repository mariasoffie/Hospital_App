import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_app/Utils/Textfield.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
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
        title: Text(
          "Sign up",
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
            Center(
              child: Container(
                height: 50,
                width: 90.w,
                child: TextField(
                  textAlign: TextAlign.start,
                  textInputAction: TextInputAction.none,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    labelText: "Enter your email",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Image.asset("lib/icons/person.png"),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            TextFields(text: "Enter your name", icon: "lib/icons/email.png"),
            SizedBox(height: 5),
            TextFields(text: "Enter your password", icon: "lib/icons/lock.png"),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: false,
                  onChanged: (bool? value) {},
                ),
                Text(
                  "I agree to the terms and conditions",
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
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
                child: Text(
                  "Create account",
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
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: GoogleFonts.poppins(
                      fontSize: 14.sp, color: Colors.black87),
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    "Sign in",
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      color: const Color.fromARGB(255, 3, 190, 150),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
