import 'package:flutter/material.dart';

import '../../../core/widgets/bottom_nav_bar.dart';
import '../../../core/widgets/cart_button.dart';
import '../../favorites/favorites_body.dart';
import '../../orders/orders_body.dart';
import '../../profile/profile_body.dart';
import 'home_body.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController();

  int pageIndex;

  @override
  void initState() {
    super.initState();
    pageIndex = 0;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _handlePageChange(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: _buildAppBar(context),
      backgroundColor: Theme.of(context).backgroundColor,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) => _handlePageChange(index),
        children: const [
          HomeBody(),
          FavoritesBody(),
          OrdersBody(),
          ProfileBody(),
        ],
      ),
      floatingActionButton: CartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(
        size: size,
        indexActive: pageIndex,
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
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
