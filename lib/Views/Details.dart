import 'package:flutter/material.dart';
import 'package:fruits_app/Constants/Colors.dart';

class Details extends StatelessWidget {
  const Details(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.description});

  final String title;
  final String imageUrl;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.network(
              imageUrl,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(title,
                      style: TextStyle(
                          color: AppColors.PRIMARY_COLOR, fontSize: 30))),
            ),
            Text(description,
                style: TextStyle(color: Colors.black, fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
