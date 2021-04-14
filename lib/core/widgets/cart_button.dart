import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/cart/bloc/cart_bloc.dart';

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
