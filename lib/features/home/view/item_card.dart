import 'dart:math';

import 'package:flutter/material.dart';

import '../../../core/constant/constant.dart';

class ItemCard extends StatelessWidget {
  final double discount;
  final bool isFavorite;
  final String imagePath;
  final String itemName;
  final double itemPrice;
  final int rating;

  const ItemCard({
    Key key,
    @required this.discount,
    @required this.isFavorite,
    @required this.imagePath,
    @required this.itemName,
    @required this.itemPrice,
    @required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildDiscount(context, discount),
                buildFavorite(isFavorite: isFavorite),
              ],
            ),
            const SizedBox(height: 10),
            Hero(
              tag: 'itemImage',
              child: AspectRatio(
                aspectRatio: 1,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      width: size.width * 0.3,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.primaries[
                                Random().nextInt(Colors.primaries.length)]
                            .withOpacity(0.4),
                      ),
                    ),
                    Image.asset(
                      imagePath,
                      fit: BoxFit.contain,
                      width: size.width * 0.3,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              itemName,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '\$ ${itemPrice.toStringAsFixed(2)}',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            buildRating(rating),
          ],
        ),
      ),
    );
  }

  CircleAvatar buildFavorite({bool isFavorite}) {
    return CircleAvatar(
      radius: 15,
      backgroundColor: isFavorite ? Colors.red : Colors.transparent,
      child: Icon(
        Icons.favorite,
        color: isFavorite ? Colors.white : Colors.grey[400],
        size: 20,
      ),
    );
  }

  Visibility buildDiscount(BuildContext context, double discount) {
    return Visibility(
      visible: discount > 0,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text('${discount.toStringAsFixed(0)}%'),
      ),
    );
  }

  Row buildRating(int rating) {
    final List<Widget> starIcons = [];

    for (var i = 0; i < 5; i++) {
      if (i < rating) {
        starIcons.add(Icon(
          Icons.star,
          size: 15,
          color: Colors.yellow[600],
        ));
      } else {
        starIcons.add(Icon(
          Icons.star,
          size: 15,
          color: Colors.grey[300],
        ));
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(children: starIcons),
        const SizedBox(width: 10),
        Text('[$rating]'),
      ],
    );
  }
}
