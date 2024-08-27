import 'package:assesment_app/features/grocery/domain/entities/grocery_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

import '../../../../core/failure/failure.dart';
import '../repository/repository_contract.dart';

class GetGroceriesUsecase  {
  final GroceryRepository groceryRepository;

  GetGroceriesUsecase({required this.groceryRepository});


  Future<Either<Failure, List<GroceryEntity>>> call()  {
    return  groceryRepository.getGroceries();
  }
}