import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/colors.dart';

class ScanActivity extends StatefulWidget {
  const ScanActivity({Key? key}) : super(key: key);

  @override
  State<ScanActivity> createState() => _ScanActivityState();
}

class _ScanActivityState extends State<ScanActivity> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: primaryColor.withOpacity(.15),
                    ),
                    child: Icon(
                      Icons.close,
                      color: primaryColor,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: primaryColor.withOpacity(.15),
                    ),
                    child: Icon(
                      Icons.share,
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
              right: 20,
              left: 20,
              child: Container(
                width: size.width*.8,
                height: size.height*.8,
                padding: EdgeInsets.all(28),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/code-scan.png',height: 100,),
                      SizedBox(height: 20,),
                      Text('Tap to Scan',style: TextStyle(
                        color: primaryColor.withOpacity(.80),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),)

                    ],
                  ),
                ),

          ))
        ],
      ),
    );
  }
}
