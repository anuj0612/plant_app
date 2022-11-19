import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_app/models/plants.dart';
import 'package:plant_app/res/colors.dart';

class DetailsActivity extends StatefulWidget {
  final int plantId;
  const DetailsActivity({Key? key, required this.plantId}) : super(key: key);

  @override
  State<DetailsActivity> createState() => _DetailsActivityState();
}

class _DetailsActivityState extends State<DetailsActivity> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> plantList = Plant.plantList;

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
                        plantList[widget.plantId].isFavorated == true
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ],
              )),
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Container(
              width: size.width * .8,
              height: size.height * .8,
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Positioned(
                      top: 10,
                      left: 0,
                      child: SizedBox(
                        height: 200,
                        child: Image.asset(plantList[widget.plantId].imageURL),
                      )),
                  Positioned(
                    top: 10,
                    right: 0,
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PlantFeature(
                            plantFeature: plantList[widget.plantId].size,
                            title: 'Size',
                          ),
                          PlantFeature(
                            plantFeature:
                                plantList[widget.plantId].humidity.toString(),
                            title: 'Humidity',
                          ),
                          PlantFeature(
                            plantFeature: plantList[widget.plantId].temperature,
                            title: 'Temperature',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
              height: size.height * .5,
              width: size.width,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(.4),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            plantList[widget.plantId].plantName,
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            r'$' + plantList[widget.plantId].price.toString(),
                            style: TextStyle(
                                color: blackColor,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            plantList[widget.plantId].rating.toString(),
                            style:
                                TextStyle(fontSize: 20.0, color: primaryColor),
                          ),
                          Icon(
                            Icons.star,
                            size: 30.0,
                            color: primaryColor,
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                    child: Text(
                      plantList[widget.plantId].decription,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        height: 1.5,
                        fontSize: 18,
                        color: blackColor.withOpacity(.7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: size.width * .9,
        height: 50,
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: primaryColor.withOpacity(.5),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 5,
                        color: primaryColor.withOpacity(.3))
                  ]),
              child: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 1),
                          blurRadius: 5,
                          color: primaryColor.withOpacity(.3))
                    ]),
                child: const Center(
                  child: Text(
                    'BUY NOW',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlantFeature extends StatelessWidget {
  final String plantFeature;
  final String title;
  const PlantFeature({
    Key? key,
    required this.plantFeature,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: primaryColor),
        ),
        Text(
          plantFeature,
          style: TextStyle(
              color: primaryColor, fontSize: 18.0, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
