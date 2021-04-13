import 'package:flutter/material.dart';
import 'package:toko_online/data/model/item.dart';

import 'item_card.dart';

class ItemGrid extends StatelessWidget {
  final List<Item> items;

  const ItemGrid({
    Key key,
    @required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      primary: false,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      childAspectRatio: 0.55,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: items
          .map(
            (item) => ItemCard(
                discount: item.discount,
                isFavorite: item.isFavorite,
                imagePath: item.imagePath,
                itemName: item.itemName,
                itemPrice: item.itemPrice,
                rating: item.rating),
          )
          .toList(),
    );
  }
}
