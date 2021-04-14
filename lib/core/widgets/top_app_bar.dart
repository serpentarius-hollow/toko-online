import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget {
  final int index;

  const TopAppBar({
    Key key,
    @required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return AppBar(
          leading: const IconButton(
            icon: Icon(Icons.menu),
            onPressed: null,
          ),
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
          actions: const [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: null,
            ),
          ],
        );
        break;
      default:
        return AppBar(
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
        );
    }
  }
}
