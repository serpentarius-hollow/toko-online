import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Item extends Equatable {
  final String id;
  final String category;
  final String itemName;
  final double itemPrice;
  final double discount;
  final bool isFavorite;
  final int rating;
  final String imagePath;

  const Item({
    @required this.id,
    @required this.category,
    @required this.itemName,
    @required this.itemPrice,
    @required this.discount,
    @required this.isFavorite,
    @required this.rating,
    @required this.imagePath,
  });

  Item copyWith({bool isFavorite}) {
    return Item(
      id: id,
      category: category,
      itemName: itemName,
      itemPrice: itemPrice,
      discount: discount,
      isFavorite: isFavorite ?? this.isFavorite,
      rating: rating,
      imagePath: imagePath,
    );
  }

  @override
  List<Object> get props => [
        id,
        category,
        itemName,
        itemPrice,
        discount,
        isFavorite,
        rating,
        imagePath,
      ];
}
