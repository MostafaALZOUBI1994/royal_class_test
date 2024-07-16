import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../data/models/product.dart';


class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                 SvgPicture.asset("assets/dropDown.svg"),
                 Text(product.name ?? "",style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),)
              ],
            ),
            Center(
              child: Image.network(
                product.images[0] ?? "",
                height: 200,
                width: 200,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    blurRadius: 60,
                    offset: Offset(0, -20),
                  ),
                ],
                borderRadius: BorderRadius.circular(30),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Stack(
                  children: [
                    // Gradient background
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(53, 63, 84, 1),
                            Color.fromRGBO(33, 39, 52, 1),
                          ],
                          begin: Alignment(0.25, 0.5),
                          end: Alignment(0.75, 0.5),
                        ),
                      ),
                      child: Column(children: [
                        Text(
                          product.name ?? "",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        const Text(
                          'Description:',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          product.description ?? "",
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Price: \$${product.price.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],) ,
                    ),
                    // Content of your view goes here

                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
