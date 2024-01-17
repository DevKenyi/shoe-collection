import 'package:flutter/material.dart';

class ProductCards extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color color;
  const ProductCards(
      {super.key,
      required this.title,
      required this.price,
      required this.image,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: color,
      ),
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              price.toString(),
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 5,
            ),
            Image.asset(image),
          ],
        ),
      ),
    );
  }
}
