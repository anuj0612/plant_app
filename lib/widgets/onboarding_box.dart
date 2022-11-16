
import 'package:flutter/material.dart';

import '../res/colors.dart';

class OnBoardingBox extends StatelessWidget {
  final String image, title, desc;
  const OnBoardingBox({
    Key? key,
    required this.image,
    required this.title,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 50.0, right: 50.0, bottom: 80.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 300.0,
            child: Image.asset(image),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: primaryColor, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}