part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeItemClickedFavorite extends HomeEvent {
  final String id;

  HomeItemClickedFavorite(this.id);
}
