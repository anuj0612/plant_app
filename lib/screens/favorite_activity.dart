import 'package:flutter/material.dart';
import 'package:plant_app/res/colors.dart';
import 'package:plant_app/widgets/plant_widget.dart';

import '../models/plants.dart';

class FavoriteActivity extends StatefulWidget {
  final List<Plant> favoritedPlants;
  const FavoriteActivity({Key? key, required this.favoritedPlants})
      : super(key: key);

  @override
  State<FavoriteActivity> createState() => _FavoriteActivityState();
}

class _FavoriteActivityState extends State<FavoriteActivity> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: widget.favoritedPlants.isNotEmpty
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: Image.asset('assets/favorited.png'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Your favorited Plants',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            )
          : Container(),
    );
  }
}
