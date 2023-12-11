import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 0.8,
        height: double.maxFinite,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.35,
              color: Colors.red,
              child: Center(
                child: CircleAvatar(
                  radius: 50,
                  child: Icon(
                    Icons.person,
                    size: 50,
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
