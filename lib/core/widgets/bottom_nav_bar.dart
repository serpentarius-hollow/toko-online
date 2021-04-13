import 'package:flutter/material.dart';

enum NavBarMenu { shop, favorites, order, account }

class BottomNavBar extends StatelessWidget {
  final NavBarMenu activeMenu;
  final Size size;

  const BottomNavBar({
    Key key,
    @required this.size,
    @required this.activeMenu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: size.width / 2 - 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.local_mall,
                    color: activeMenu == NavBarMenu.shop
                        ? Theme.of(context).primaryColor
                        : null,
                  ),
                  onPressed: null,
                ),
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: activeMenu == NavBarMenu.favorites
                        ? Theme.of(context).primaryColor
                        : null,
                  ),
                  onPressed: null,
                ),
              ],
            ),
          ),
          SizedBox(
            width: size.width / 2 - 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.library_books,
                    color: activeMenu == NavBarMenu.order
                        ? Theme.of(context).primaryColor
                        : null,
                  ),
                  onPressed: null,
                ),
                IconButton(
                  icon: Icon(
                    Icons.person,
                    color: activeMenu == NavBarMenu.account
                        ? Theme.of(context).primaryColor
                        : null,
                  ),
                  onPressed: null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
