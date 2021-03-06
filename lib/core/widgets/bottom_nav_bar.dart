import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int indexActive;
  final Size size;
  final void Function(int) onButtonPressed;

  const BottomNavBar({
    Key key,
    @required this.indexActive,
    @required this.size,
    @required this.onButtonPressed,
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
                    color: indexActive == 0
                        ? Theme.of(context).primaryColor
                        : null,
                  ),
                  onPressed: () => onButtonPressed(0),
                ),
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: indexActive == 1
                        ? Theme.of(context).primaryColor
                        : null,
                  ),
                  onPressed: () => onButtonPressed(1),
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
                    color: indexActive == 2
                        ? Theme.of(context).primaryColor
                        : null,
                  ),
                  onPressed: () => onButtonPressed(2),
                ),
                IconButton(
                  icon: Icon(
                    Icons.person,
                    color: indexActive == 3
                        ? Theme.of(context).primaryColor
                        : null,
                  ),
                  onPressed: () => onButtonPressed(3),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
