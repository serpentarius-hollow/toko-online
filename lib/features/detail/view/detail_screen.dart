import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toko_online/features/home/bloc/home_bloc.dart';

import '../../../core/constant/constant.dart';
import '../../../core/constant/hexcolor.dart';
import '../../../data/model/item.dart';

class DetailScreen extends StatefulWidget {
  final Item item;

  const DetailScreen({
    Key key,
    @required this.item,
  }) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String sizeValue;
  String colorValue;
  bool isFavorite;

  @override
  void initState() {
    super.initState();
    sizeValue = 'S';
    colorValue = '#FF0000';
    isFavorite = widget.item.isFavorite;
  }

  void _handleSizeButton(String itemSize) {
    setState(() {
      sizeValue = itemSize;
    });
  }

  void _handleColorButton(String itemColor) {
    setState(() {
      colorValue = itemColor;
    });
  }

  void _handleFavoriteButton(String id) {
    setState(() {
      isFavorite = !isFavorite;
      context.read<HomeBloc>().add(HomeItemClickedFavorite(id));
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: _buildAppBar(
        isFavorite,
        () => _handleFavoriteButton(widget.item.id),
        context,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Column(
            children: [
              _buildDiscount(context, widget.item.discount),
              _buildImage(size, widget.item.imagePath, colorValue, sizeValue),
            ],
          ),
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  padding: const EdgeInsets.all(kPadding),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildNameRow(
                        context,
                        widget.item.itemName,
                        widget.item.rating,
                      ),
                      const SizedBox(height: 10),
                      const Text('Description Text'),
                      const SizedBox(height: 20),
                      _buildSizeRow(context, sizeValue),
                      const SizedBox(height: 10),
                      _buildColorRow(context, colorValue),
                    ],
                  ),
                ),
                _buildPriceRow(widget.item.itemPrice, size, context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _buildPriceRow(double itemPrice, Size size, BuildContext context) {
    return Container(
      height: size.height * 0.13,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '\$$itemPrice',
            style: Theme.of(context).textTheme.headline5.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
          ),
          FlatButton(
            onPressed: () {},
            highlightColor: Theme.of(context).accentColor,
            splashColor: Theme.of(context).accentColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.shopping_cart,
                  color: Theme.of(context).primaryColor,
                ),
                Text(
                  'Add To Cart',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Row _buildColorRow(BuildContext context, String colorValue) {
    return Row(
      children: [
        const Text('Available Color'),
        const SizedBox(width: 30),
        _buildColorButton(
          '#FF0000',
          colorValue,
          context,
          () => _handleColorButton('#FF0000'),
        ),
        const SizedBox(width: 10),
        _buildColorButton(
          '#0000FF',
          colorValue,
          context,
          () => _handleColorButton('#0000FF'),
        ),
        const SizedBox(width: 10),
        _buildColorButton(
          '#00FF00',
          colorValue,
          context,
          () => _handleColorButton('#00FF00'),
        ),
      ],
    );
  }

  Row _buildSizeRow(
    BuildContext context,
    String sizeValue,
  ) {
    return Row(
      children: [
        const Text('Size'),
        const SizedBox(width: 30),
        _buildSizeButton(
          'S',
          sizeValue,
          context,
          () => _handleSizeButton('S'),
        ),
        const SizedBox(width: 10),
        _buildSizeButton(
          'M',
          sizeValue,
          context,
          () => _handleSizeButton('M'),
        ),
        const SizedBox(width: 10),
        _buildSizeButton(
          'L',
          sizeValue,
          context,
          () => _handleSizeButton('L'),
        ),
        const SizedBox(width: 10),
        _buildSizeButton(
          'XL',
          sizeValue,
          context,
          () => _handleSizeButton('XL'),
        ),
      ],
    );
  }

  Container _buildColorButton(
    String itemColor,
    String colorValue,
    BuildContext context,
    void Function() colorButtonOnTap,
  ) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // borderRadius: BorderRadius.circular(10),
        color: colorValue == itemColor
            ? HexColor(itemColor).withOpacity(0.3)
            : Colors.transparent,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: colorButtonOnTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: CircleAvatar(
              radius: 10,
              backgroundColor: HexColor(itemColor),
            ),
          ),
        ),
      ),
    );
  }

  Container _buildSizeButton(
    String itemSize,
    String sizeValue,
    BuildContext context,
    void Function() sizeButtonOnTap,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: sizeValue == itemSize
            ? Theme.of(context).accentColor
            : Colors.transparent,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: sizeButtonOnTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Text(itemSize),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(
    bool isFavorite,
    void Function() onFavoriteButtonPressed,
    BuildContext context,
  ) {
    return AppBar(
      leading: BackButton(color: Theme.of(context).primaryColor),
      title: Center(
        child: Text(
          'XE',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
          icon: CircleAvatar(
            radius: 15,
            backgroundColor: isFavorite ? Colors.red : Colors.transparent,
            child: Icon(
              Icons.favorite,
              color: isFavorite ? Colors.white : Colors.grey[400],
              size: 20,
            ),
          ),
          onPressed: onFavoriteButtonPressed,
        ),
      ],
    );
  }

  Row _buildNameRow(BuildContext context, String itemName, int rating) {
    return Row(
      children: [
        Expanded(
          child: Text(
            itemName,
            style: Theme.of(context).textTheme.headline5.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.star,
              // size: 15,
              color: Colors.yellow[600],
            ),
            const SizedBox(width: 10),
            Text('[$rating]'),
          ],
        )
      ],
    );
  }

  double _changeImageSize(String sizeValue, Size size) {
    switch (sizeValue) {
      case 'M':
        return size.width * 0.43;
        break;
      case 'L':
        return size.width * 0.46;
        break;
      case 'XL':
        return size.width * 0.49;
        break;
      default:
        return size.width * 0.4;
    }
  }

  AspectRatio _buildImage(
    Size size,
    String imagePath,
    String colorValue,
    String sizeValue,
  ) {
    return AspectRatio(
      aspectRatio: 1.4,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            width: size.width * 0.6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: HexColor(colorValue).withOpacity(0.4),
            ),
          ),
          Image.asset(
            imagePath,
            fit: BoxFit.contain,
            width: _changeImageSize(sizeValue, size),
          ),
        ],
      ),
    );
  }

  Visibility _buildDiscount(BuildContext context, double discount) {
    return Visibility(
      visible: widget.item.discount > 0,
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
}
