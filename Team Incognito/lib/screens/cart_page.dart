import 'package:canteen_management/provider/app_provider.dart';
import 'package:canteen_management/widgets/single_food_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = context.watch<AppProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Total Price: ₹${appProvider.totalPrice}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ...appProvider.cart.map((e) => SingleFoodItem(item: e)),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        width: double.maxFinite,
        height: 40,
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid, width: 1), borderRadius: BorderRadius.circular(15), color: Colors.black),
        child: const Center(
          child: Text(
            "Order Now",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
