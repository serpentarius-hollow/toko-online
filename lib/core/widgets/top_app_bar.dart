import 'package:flutter/material.dart';

class TopAppBar extends StatefulWidget {
  final int index;

  const TopAppBar({
    Key key,
    @required this.index,
  }) : super(key: key);

  @override
  _TopAppBarState createState() => _TopAppBarState();
}

class _TopAppBarState extends State<TopAppBar> {
  bool toggleSearch;

  @override
  void initState() {
    super.initState();
    toggleSearch = false;
  }

  void _handleToggleSearch() {
    setState(() {
      toggleSearch = !toggleSearch;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.index) {
      case 0:
        return AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: null,
          ),
          title: Center(
            child: toggleSearch
                ? TextField(
                    decoration: const InputDecoration(
                      hintText: 'Search...',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                    textInputAction: TextInputAction.search,
                    onSubmitted: (val) => _handleToggleSearch(),
                  )
                : Text(
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
              icon: Icon(
                toggleSearch ? Icons.close : Icons.search,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () => _handleToggleSearch(),
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
