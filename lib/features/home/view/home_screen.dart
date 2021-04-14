import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/bottom_nav_bar.dart';
import '../../cart/bloc/cart_bloc.dart';
import 'home_body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: _buildAppBar(context),
      backgroundColor: Theme.of(context).backgroundColor,
      body: const HomeBody(),
      floatingActionButton: CartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(
        size: size,
        activeMenu: NavBarMenu.shop,
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

class CartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: null,
          child: Icon(
            Icons.shopping_cart,
            color: Theme.of(context).accentColor,
          ),
        ),
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoadSuccess) {
              return Visibility(
                visible: state.count > 0,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    state.count.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(color: Colors.white),
                  ),
                ),
              );
            }
            return Container();
          },
        )
      ],
    );
  }
}
