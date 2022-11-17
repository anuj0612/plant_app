import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_app/res/colors.dart';
import 'package:plant_app/screens/cart_activity.dart';
import 'package:plant_app/screens/favorite_activity.dart';
import 'package:plant_app/screens/home_activity.dart';
import 'package:plant_app/screens/profile_activity.dart';
import 'package:plant_app/screens/scan_activity.dart';

class RootActivity extends StatefulWidget {
  const RootActivity({Key? key}) : super(key: key);

  @override
  State<RootActivity> createState() => _RootActivityState();
}

class _RootActivityState extends State<RootActivity> {
  int currentIndex = 0;
  List<Widget> pages = [
    const HomeActivity(),
    const FavoriteActivity(),
    const CartActivity(),
    const ProfileActivity()
  ];

  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person
  ];

  List<String> titleList = ['Home', 'Favorite', 'Cart', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleList[currentIndex],
              style: TextStyle(
                  color: blackColor, fontWeight: FontWeight.w500, fontSize: 24),
            ),
            Icon(
              Icons.notifications,
              color: blackColor,
              size: 30.0,
            ),
          ],
        ),
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const ScanActivity(), transition: Transition.downToUp);
        },
        backgroundColor: primaryColor,
        child: Image.asset('assets/code-scan-two.png',height: 30.0,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: primaryColor,
        activeColor: primaryColor,
        inactiveColor: Colors.black.withOpacity(0.5),
        icons: iconList,
        activeIndex: currentIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },

      ),
    );
  }
}
