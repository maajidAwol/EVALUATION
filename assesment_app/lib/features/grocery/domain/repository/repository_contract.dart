import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entities/grocery_entity.dart';

abstract class GroceryRepository {
  Future<Either<Failure, List<GroceryEntity>>> getGroceries();
  Future<Either<Failure, GroceryEntity>> getGrocery(String id);
  
}