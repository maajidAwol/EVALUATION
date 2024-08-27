part of 'details_bloc.dart';

sealed class DetailsEvent extends Equatable {
  const DetailsEvent();

  @override
  List<Object> get props => [];
}

class FetchGroceryDetails extends DetailsEvent {
  final String id;

  FetchGroceryDetails({required this.id});
}