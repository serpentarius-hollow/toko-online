import 'package:flutter/material.dart';

import '../../../core/widgets/bottom_nav_bar.dart';
import 'home_body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Theme.of(context).backgroundColor,
      body: const HomeBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: null,
        child: Icon(
          Icons.shopping_cart,
          color: Theme.of(context).accentColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(
        size: size,
        activeMenu: NavBarMenu.shop,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
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
  }
}
