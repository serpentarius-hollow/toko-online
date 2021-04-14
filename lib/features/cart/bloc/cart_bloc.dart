import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartLoadSuccess(0));

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    final currentState = state;

    if (event is CartAddedItem) {
      if (currentState is CartLoadSuccess) {
        var newCount = currentState.count;

        newCount++;

        final newState = currentState.copyWith(count: newCount);

        yield const CartAddSuccess('Sukses Menambahkan Item');
        yield newState;
      }
    }
  }
}
