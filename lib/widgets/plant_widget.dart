import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/plants.dart';
import '../res/colors.dart';
import '../screens/details_activity.dart';

class PlantWidget extends StatelessWidget {
  const PlantWidget({Key? key,required List<Plant> plantList, required this.index,}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    List<Plant> _plantList = Plant.plantList;
    return GestureDetector(
      onTap: () {
        Get.to(() => DetailsActivity(plantId: _plantList[index].plantId,),transition: Transition.downToUp);
      },
      child: Container(
        width: 200,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: primaryColor.withOpacity(.8),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              right: 20,
              child: Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: IconButton(
                  onPressed: () {
                    // bool isFav = toggleIsFavorite(
                    //     _plantList[index].isFavorated);
                    // _plantList[index].isFavorated = isFav;
                    // setState(() {});
                  },
                  icon: Icon(
                    _plantList[index].isFavorated == true
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: primaryColor,
                  ),
                  iconSize: 30.0,
                ),
              ),
            ),
            Positioned(
                left: 50,
                right: 50,
                top: 50,
                bottom: 50,
                child: Image.asset(_plantList[index].imageURL)),
            Positioned(
                bottom: 15,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _plantList[index].category,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      _plantList[index].plantName,
                      style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
            Positioned(
              bottom: 15,
              right: 20,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  r'$' + _plantList[index].price.toString(),
                  style: TextStyle(
                      color: primaryColor, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
