import 'package:flutter/material.dart';

class ShoppingCards extends StatelessWidget {
  final String name;
  final String price;
  final String image;
  final Color color;

  const ShoppingCards(
      {super.key,
      required this.name,
      required this.price,
      required this.image,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.fromBorderSide(BorderSide(style: BorderStyle.solid)),
            borderRadius: BorderRadius.circular(50),
            color: color),
        margin: EdgeInsets.all(5),
        height: 300,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              Text(
                "\$$price",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Center(
                  child: Image.asset(
                image,
                height: 170,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
