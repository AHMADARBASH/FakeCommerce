import 'package:fakecommerce/layout/screens/product_details_screen.dart';
import 'package:fakecommerce/utilities/context_extenstions.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  const ProductWidget({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ProductDetailsScreen.routeName,
            arguments: {"id": id, "image": image});
      },
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                blurRadius: 3,
                spreadRadius: 0,
                color: Colors.grey[400]!,
                offset: Offset(1, 1)),
          ],
        ),
        child: Stack(children: [
          Column(
            children: [
              SizedBox(
                width: context.width * 0.3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Hero(
                    tag: id,
                    child: FadeInImage(
                      placeholder: AssetImage('assets/images/purple_logo.png'),
                      image: NetworkImage(image),
                      fadeInDuration: Duration(seconds: 1),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(title, textAlign: TextAlign.center),
              )
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(3),
              alignment: Alignment.topRight,
              child: Icon(Icons.favorite_border),
            ),
          )
        ]),
      ),
    );
  }
}
