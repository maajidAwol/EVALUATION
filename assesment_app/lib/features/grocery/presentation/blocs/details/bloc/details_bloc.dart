import 'dart:async';

import 'package:assesment_app/features/grocery/domain/usecases/get_grocery.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/grocery_entity.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  GetGroceryUsecase getGroceryUsecase;
  DetailsBloc({required this.getGroceryUsecase}) : super(DetailsInitial()) {
    on<FetchGroceryDetails>(_onFetchGroceryDetails);
  }

  FutureOr<void> _onFetchGroceryDetails(FetchGroceryDetails event, Emitter<DetailsState> emit) async{
    emit(DetailsLoading());

    final result = await getGroceryUsecase.call(event.id);
    result.fold(
      (failure) => emit(
        DetailsError(message: failure.message),
      ),
      (grocery) => emit(
        DetailsLoaded(grocery: grocery),
      )
    );


  }
}

