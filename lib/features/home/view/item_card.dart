import 'package:flutter/material.dart';
import 'package:toko_online/core/router/router_name.dart';
import 'package:toko_online/data/model/item.dart';

import '../../../core/constant/constant.dart';

class ItemCard extends StatelessWidget {
  final Item item;

  const ItemCard({
    Key key,
    @required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () => Navigator.pushNamed(
            context,
            routeDetail,
            arguments: {'item': item},
          ),
          child: Padding(
            padding: const EdgeInsets.all(kPadding),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildDiscount(context, item.discount),
                    _buildFavorite(isFavorite: item.isFavorite),
                  ],
                ),
                const SizedBox(height: 10),
                _buildImage(size),
                const SizedBox(height: 10),
                Text(
                  item.itemName,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '\$ ${item.itemPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                _buildRating(item.rating),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AspectRatio _buildImage(Size size) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            width: size.width * 0.3,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // color: Colors.primaries[Random().nextInt(Colors.primaries.length)]
              //     .withOpacity(0.4),
              color: Colors.grey[300],
            ),
          ),
          Image.asset(
            item.imagePath,
            fit: BoxFit.contain,
            width: size.width * 0.3,
          ),
        ],
      ),
    );
  }

  CircleAvatar _buildFavorite({bool isFavorite}) {
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

  Visibility _buildDiscount(BuildContext context, double discount) {
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

  Row _buildRating(int rating) {
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
