part of 'details_bloc.dart';

sealed class DetailsState extends Equatable {
  const DetailsState();
  
  @override
  List<Object> get props => [];
}

final class DetailsInitial extends DetailsState {}

class DetailsLoading extends DetailsState {}

class DetailsLoaded extends DetailsState {
  final GroceryEntity grocery;
  DetailsLoaded({required this.grocery});
  @override
  List<Object> get props => [grocery];
}
class DetailsError extends DetailsState {
  final String message;
  DetailsError({required this.message});
  @override
  List<Object> get props => [message];
}
