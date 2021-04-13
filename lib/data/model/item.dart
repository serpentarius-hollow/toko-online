import 'package:meta/meta.dart';

class Item {
  final String id;
  final String category;
  final String itemName;
  final double itemPrice;
  final double discount;
  final bool isFavorite;
  final int rating;
  final String imagePath;

  Item({
    @required this.id,
    @required this.category,
    @required this.itemName,
    @required this.itemPrice,
    @required this.discount,
    @required this.isFavorite,
    @required this.rating,
    @required this.imagePath,
  });
}
