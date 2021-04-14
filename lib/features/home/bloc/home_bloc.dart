import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../data/model/item.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final List<Item> items;

  HomeBloc(this.items) : super(HomeLoadSuccess(items));

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    final currentState = state;

    if (event is HomeItemClickedFavorite) {
      if (currentState is HomeLoadSuccess) {
        final newItems = List<Item>.from(currentState.items);

        final index = newItems.indexWhere((element) => element.id == event.id);

        newItems[index] =
            newItems[index].copyWith(isFavorite: !newItems[index].isFavorite);

        final newState = currentState.copyWith(items: newItems);

        yield newState;
      }
    }
  }
}
