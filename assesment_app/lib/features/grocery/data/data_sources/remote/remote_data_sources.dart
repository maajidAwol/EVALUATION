import '../../models/grocery_model.dart';

abstract class RemoteDataSources {
  Future<List<GroceryModel>> getGroceries();
  Future<GroceryModel> getGrocery(String id);
}