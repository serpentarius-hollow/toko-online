part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeItemClickedFavorite extends HomeEvent {
  final String id;

  const HomeItemClickedFavorite(this.id);
}

class HomeSearchBar extends HomeEvent {
  final String query;

  const HomeSearchBar(this.query);
}

class HomeRefresh extends HomeEvent {}
