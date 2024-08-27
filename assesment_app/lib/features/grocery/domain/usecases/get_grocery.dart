import 'package:assesment_app/features/grocery/domain/entities/grocery_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../repository/repository_contract.dart';

class GetGroceryUsecase {
  final GroceryRepository groceryRepository;

  GetGroceryUsecase({required this.groceryRepository});

  Future<Either<Failure, GroceryEntity>> call(String id) {
    {
      return groceryRepository.getGrocery(id);
    }
  }
}
