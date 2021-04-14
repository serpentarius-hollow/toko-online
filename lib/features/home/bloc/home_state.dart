part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoadInProgress extends HomeState {}

class HomeLoadSuccess extends HomeState {
  final List<Item> items;

  HomeLoadSuccess(this.items);

  HomeLoadSuccess copyWith({List<Item> items}) {
    return HomeLoadSuccess(items ?? this.items);
  }

  @override
  List<Object> get props => [items];
}
