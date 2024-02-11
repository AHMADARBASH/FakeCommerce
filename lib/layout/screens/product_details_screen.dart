import 'package:fakecommerce/utilities/context_extenstions.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const String routeName = '/ProductDetilsScreen';
  final int id;
  final String image;
  const ProductDetailsScreen(
      {required this.id, required this.image, super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FadeInRight(
            duration: Duration(milliseconds: 400),
            delay: Duration(milliseconds: 300),
            curve: Curves.easeOutQuad,
            child: Container(
              decoration: BoxDecoration(
                color: context.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              padding: EdgeInsets.only(right: 15, left: 5),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Hero(
            tag: widget.id,
            child: Image.network(
              widget.image,
            ),
          )
        ],
      ),
    );
  }
}
