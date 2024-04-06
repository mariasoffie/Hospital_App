import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_app/Service/LoginOrSignup/HALoginSignup.dart';
import 'package:hospital_app/Service/OnBoarding/HAOnboarding1.dart';
import 'package:hospital_app/Service/OnBoarding/HAOnboarding2.dart';
import 'package:hospital_app/Service/OnBoarding/HAOnboarding3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HAOnboardingPage extends StatefulWidget {
  const HAOnboardingPage({Key? key}) : super(key: key);

  @override
  _HAOnboardingPageState createState() => _HAOnboardingPageState();
}

class _HAOnboardingPageState extends State<HAOnboardingPage> {
  final PageController _controller = PageController();
  final bool onLastpage = false.obs as bool;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              final RxBool onLastpage = false.obs;
              onLastpage.value = (index == 2);
            },
            children: [
              HAOnboarding1(),
              HAOnboarding2(),
              HAOnboarding3(),
            ],
          ),
          Positioned(
            left: 20,
            bottom: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: Text(
                    "Skip",
                    style: GoogleFonts.inter(fontSize: 15, color: Colors.grey),
                  ),
                ),
                Obx(() => SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: SlideEffect(
                        spacing: 4.0,
                        radius: 4.0,
                        dotWidth: 14.0,
                        dotHeight: 7.0,
                        strokeWidth: 1.5,
                        dotColor: Color.fromARGB(255, 170, 255, 237),
                        activeDotColor: const Color.fromARGB(255, 3, 190, 150),
                      ),
                    )),
                Obx(() => onLastpage
                    ? GestureDetector(
                        onTap: () {
                          Get.to(() => HALoginSignupScreen());
                        },
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 3, 190, 150),
                            borderRadius: BorderRadius.circular(35),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Done",
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    letterSpacing: 1,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Image.asset(
                                  "lib/icons/check.png",
                                  height: 20,
                                  width: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 3, 190, 150),
                            borderRadius: BorderRadius.circular(35),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Next",
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    letterSpacing: 1,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Image.asset(
                                  "lib/icons/arrow.png",
                                  height: 20,
                                  width: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
