import 'package:canteen_management/models/food_item.dart';
import 'package:canteen_management/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleFoodItem extends StatelessWidget {
  final FoodItem item;
  const SingleFoodItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final appProvider = context.watch<AppProvider>();
    return Card(
      color: Colors.grey[100],
      margin: const EdgeInsets.all(8),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
            child: Image.asset(
              item.image,
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.4,
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.555,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/veg.png",
                    height: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        child: Text(
                          item.name,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        child: Text(
                          "₹${item.price}/-",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  item.quantity == 0
                      ? GestureDetector(
                          onTap: () {
                            appProvider.addQuantity(item);
                            appProvider.addToCart(item);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            width: double.maxFinite,
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid, width: 1), borderRadius: BorderRadius.circular(15), color: Colors.black),
                            child: const Center(
                              child: Text(
                                "Add +",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(onPressed: () => appProvider.addQuantity(item), icon: const Icon(Icons.add)),
                            Text(
                              item.quantity.toString(),
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            IconButton(
                              onPressed: () => appProvider.decreaseQuantity(item),
                              icon: const Text(
                                "-",
                                style: TextStyle(fontSize: 40, height: 0),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
