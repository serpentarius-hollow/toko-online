part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoadInProgress extends HomeState {}

class HomeLoadSuccess extends HomeState {
  final List<Item> items;

  const HomeLoadSuccess(this.items);

  HomeLoadSuccess copyWith({List<Item> items}) {
    return HomeLoadSuccess(items ?? this.items);
  }

  @override
  List<Object> get props => [items];
}
