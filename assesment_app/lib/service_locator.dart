import 'package:assesment_app/core/network/network_info.dart';
import 'package:assesment_app/features/grocery/data/data_sources/remote/grocery_remote_data_sources.dart';
import 'package:assesment_app/features/grocery/data/repository/repostory_implimetation.dart';
import 'package:assesment_app/features/grocery/domain/repository/repository_contract.dart';
import 'package:assesment_app/features/grocery/domain/usecases/get_all_groceries.dart';
import 'package:assesment_app/features/grocery/domain/usecases/get_grocery.dart';
import 'package:assesment_app/features/grocery/presentation/blocs/details/bloc/details_bloc.dart';
import 'package:assesment_app/features/grocery/presentation/blocs/home/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'features/grocery/data/data_sources/remote/remote_data_sources.dart';
import 'package:http/http.dart' as http;

GetIt serviceLocator = GetIt.instance;

Future<void> setup() async {
  var client = http.Client();
  var networkInfo = InternetConnectionChecker();
  //grocery
  //data
  serviceLocator.registerFactory<NetworkInfo>(() => NetworkInfoImplimentation(internetStatus: networkInfo));
  serviceLocator.registerSingleton<GroceryRemoteDataSources>(
     GroceryRemoteDataSources(client: client));
  serviceLocator.registerSingleton<GroceryRepository>( GroceryRepositroyImpl(groceryDataSource: serviceLocator(), networkInfo: serviceLocator()));

  
//domain
  serviceLocator.registerSingleton< GetGroceriesUsecase>(GetGroceriesUsecase(groceryRepository: serviceLocator()));
  serviceLocator.registerSingleton<GetGroceryUsecase>( GetGroceryUsecase(groceryRepository: serviceLocator()));

  //presentation
  // serviceLocator.registerFactory(() => GroceryBloc(getGroceriesUsecase: serviceLocator(), getGroceryUsecase: serviceLocator()));
  
serviceLocator.registerSingleton<HomeBloc>(HomeBloc(getGroceriesUsecase: serviceLocator()));
serviceLocator.registerSingleton<DetailsBloc>(DetailsBloc(getGroceryUsecase: serviceLocator()));


  
}
