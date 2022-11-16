import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_app/res/colors.dart';
import 'package:plant_app/res/string.dart';
import 'package:plant_app/screens/auth/login_activity.dart';

import '../../widgets/onboarding_box.dart';

class OnBoardingActivity extends StatefulWidget {
  const OnBoardingActivity({Key? key}) : super(key: key);

  @override
  State<OnBoardingActivity> createState() => _OnBoardingActivityState();
}

class _OnBoardingActivityState extends State<OnBoardingActivity> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 20.0),
            child: InkWell(
              onTap: (){
                Get.to(() => const LoginActivity());
              },
              child: const Text(
                "Skip",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            controller: _pageController,
            children: [
              OnBoardingBox(
                image: 'assets/plant-one.png',
                title: titleOne,
                desc: descriptionOne,
              ),
              OnBoardingBox(
                image: 'assets/plant-two.png',
                title: titleTwo,
                desc: descriptionTwo,
              ),
              OnBoardingBox(
                image: 'assets/plant-three.png',
                title: titleThree,
                desc: descriptionThree,
              ),
            ],
          ),
          Positioned(
              bottom: 80.0,
              left: 30.0,
              child: Row(
                children: _buildIndicator(currentIndex),
              )),
          Positioned(
              bottom: 60.0,
              right: 30.0,
              child: Container(
                padding:const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryColor
                ),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (currentIndex < 2) {
                        currentIndex++;
                        if (currentIndex < 3) {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        }
                      } else {
                        Get.to(() => const LoginActivity());
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

List<Widget> _buildIndicator(int currentIndex) {
  List<Widget> indicators = [];

  for (int i = 0; i < 3; i++) {
    if (currentIndex == i) {
      indicators.add(_indicator(true));
    } else {
      indicators.add(_indicator(false));
    }
  }
  return indicators;
}

Widget _indicator(bool isActive) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    height: 10.0,
    width: isActive ? 20 : 8,
    margin: const EdgeInsets.only(right: 5.0),
    decoration: BoxDecoration(
      color: primaryColor,
      borderRadius: BorderRadius.circular(5.0),
    ),
  );
}


