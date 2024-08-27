import 'dart:async';

import 'package:assesment_app/features/grocery/domain/usecases/get_all_groceries.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/grocery_entity.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetGroceriesUsecase getGroceriesUsecase;
  HomeBloc({required this.getGroceriesUsecase}) : super(HomeInitial()) {
    on<FetchGroceries>(_onFetchGroceries);
  }

  FutureOr<void> _onFetchGroceries(
      FetchGroceries event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    final result = await getGroceriesUsecase.call();
    result.fold(
        (failure) => emit(
              HomeError(message: failure.message),
            ),
        (groceries) => emit(
              HomeLoaded(groceries: groceries),
            ));
  }
}
