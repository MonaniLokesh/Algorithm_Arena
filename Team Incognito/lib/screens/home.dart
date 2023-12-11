import 'package:canteen_management/constants/global_constants.dart';
import 'package:canteen_management/screens/cart_page.dart';
import 'package:canteen_management/widgets/drawer.dart';
import 'package:canteen_management/widgets/single_food_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Masala Darbar",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage())),
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ))
        ],
      ),
      body: ListView.builder(
        itemCount: menu.length,
        // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) => Column(
          children: [
            SingleFoodItem(
              item: menu[index],
            ),
          ],
        ),
      ),
    );
  }
}
