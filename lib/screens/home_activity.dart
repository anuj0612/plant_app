import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_app/models/plants.dart';
import 'package:plant_app/res/colors.dart';
import 'package:plant_app/screens/details_activity.dart';
import 'package:plant_app/widgets/plant_widget.dart';

class HomeActivity extends StatefulWidget {
  const HomeActivity({Key? key}) : super(key: key);

  @override
  State<HomeActivity> createState() => _HomeState();
}

class _HomeState extends State<HomeActivity> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;
    List<Plant> _plantList = Plant.plantList;
    List<String> _plantType = [
      'Recommended',
      'Indoor',
      'Outdoor',
      'Garden',
      'Supplement'
    ];

    bool toggleIsFavorite(bool isFav) {
      return !isFav;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(.1),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    width: size.width * .9,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.black54.withOpacity(.6),
                        ),
                        const Expanded(
                          child: TextField(
                            showCursor: false,
                            decoration: InputDecoration(
                                hintText: 'Search plant',
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none),
                          ),
                        ),
                        Icon(
                          Icons.mic,
                          color: Colors.black54.withOpacity(.6),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              height: 50.0,
              width: size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _plantType.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Text(
                          _plantType[index],
                          style: TextStyle(
                            color: selectedIndex == index
                                ? primaryColor
                                : blackColor,
                            fontSize: 16.0,
                            fontWeight: selectedIndex == index
                                ? FontWeight.bold
                                : FontWeight.w300,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: size.height * .3,
              child: ListView.builder(
                  itemCount: _plantList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return PlantWidget(
                      plantList: [],
                      index: index,
                    );
                  }),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
              child: const Text(
                'New Plants',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: size.height * .5,
              child: ListView.builder(
                  itemCount: _plantList.length,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                            () => DetailsActivity(
                                  plantId: _plantList[index].plantId,
                                ),
                            transition: Transition.downToUp);
                      },
                      child: Container(
                        height: 80.0,
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        margin: const EdgeInsets.only(bottom: 10, top: 10),
                        width: size.width,
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  width: 60.0,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: primaryColor.withOpacity(.8),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Positioned(
                                  bottom: 5,
                                  left: 0,
                                  right: 0,
                                  child: SizedBox(
                                    height: 80.0,
                                    child:
                                        Image.asset(_plantList[index].imageURL),
                                  ),
                                ),
                                Positioned(
                                  bottom: 5,
                                  left: 80,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(_plantList[index].category),
                                      Text(
                                        _plantList[index].plantName,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: blackColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                r'$' + _plantList[index].price.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    color: primaryColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
