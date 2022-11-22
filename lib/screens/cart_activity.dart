import 'package:flutter/material.dart';

import '../models/plants.dart';
import '../res/colors.dart';
import '../widgets/plant_widget.dart';

class CartActivity extends StatefulWidget {
  final List<Plant> addedToCartPlants;
  const CartActivity({Key? key, required this.addedToCartPlants}) : super(key: key);

  @override
  State<CartActivity> createState() => _CartActivityState();
}

class _CartActivityState extends State<CartActivity> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      body: widget.addedToCartPlants.isEmpty
          ? Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: Image.asset('assets/add-cart.png'),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Your Cart is Empty',
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w300,
                fontSize: 18,
              ),
            ),
          ],
        ),
      )
          : Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
        height: size.height,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: widget.addedToCartPlants.length,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return PlantWidget(
                        index: index, plantList: widget.addedToCartPlants);
                  }),
            ),
            Column(
              children: [
                const Divider(thickness: 1.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Totals',style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w300,
                    ),
                    ),
                    Text(r'$65', style: TextStyle(
                      fontSize: 24.0,
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
