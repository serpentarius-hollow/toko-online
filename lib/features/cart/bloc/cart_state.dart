part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartLoadSuccess extends CartState {
  final int count;

  const CartLoadSuccess(this.count);

  CartLoadSuccess copyWith({int count}) {
    return CartLoadSuccess(count ?? this.count);
  }

  @override
  List<Object> get props => [count];
}
