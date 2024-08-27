part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
  
  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<GroceryEntity> groceries;
  HomeLoaded({required this.groceries});
  @override
  List<Object> get props => [groceries];
}

final class HomeError extends HomeState {
  final String message;
  HomeError({required this.message});
  @override
  List<Object> get props => [message];
}