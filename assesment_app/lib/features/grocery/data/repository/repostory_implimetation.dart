import 'package:assesment_app/core/failure/exceptions.dart';
import 'package:assesment_app/core/failure/failure.dart';
import 'package:assesment_app/core/network/network_info.dart';
import 'package:assesment_app/features/grocery/data/models/grocery_model.dart';
import 'package:assesment_app/features/grocery/domain/entities/grocery_entity.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repository/repository_contract.dart';
import '../data_sources/remote/grocery_remote_data_sources.dart';

class GroceryRepositroyImpl extends GroceryRepository {
  final GroceryRemoteDataSources groceryDataSource;
  final NetworkInfo networkInfo;

  GroceryRepositroyImpl({required this.groceryDataSource, required this.networkInfo});

  @override
  Future<Either<Failure,List<GroceryModel>>> getGroceries() async {
    final isConnected = await networkInfo.isConnected;
    if(isConnected){
      try{
        final groceries = await groceryDataSource.getGroceries();
        return Right(groceries);
      } on ServerException {
        return Left(ServerFailure("Server Failure"));
      }

    
  }
  else{
    return Left(ConnectionFailure("Connection1 Failure"));
  }

 
}

  @override
  Future<Either<Failure, GroceryModel>> getGrocery(String id) async{
     final isConnected = await networkInfo.isConnected;
    if(isConnected){
      try{
        final groceries = await groceryDataSource.getGrocery(id);
        return Right(groceries);
      } on ServerException {
        return Left(ServerFailure("Server Failure"));
      }

    
  }
  else{
    return Left(ConnectionFailure("Connection Failure"));
  }
   
  }





  
}