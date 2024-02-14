import 'package:fakecommerce/utilities/context_extenstions.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final int index;
  final int globalIndex;
  final String title;
  const CategoryWidget(
      {super.key,
      required this.index,
      required this.globalIndex,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 50,
      constraints: BoxConstraints(maxHeight: 50),
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: index == globalIndex ? context.primaryColor : context.tertiary,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            blurRadius: 3,
            spreadRadius: 1,
            offset: Offset(2, 2),
          )
        ],
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color:
                index == globalIndex ? context.tertiary : context.primaryColor),
      ),
    );
  }
}
