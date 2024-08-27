import 'dart:convert';

import 'package:assesment_app/core/constants/urls.dart';
import 'package:assesment_app/features/grocery/data/data_sources/remote/remote_data_sources.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/failure/exceptions.dart';
import '../../models/grocery_model.dart';

class GroceryRemoteDataSources extends RemoteDataSources {
  final http.Client client;

  GroceryRemoteDataSources({required this.client});

  @override
  Future<List<GroceryModel>> getGroceries() async {
    final response = await client.get(Uri.parse(Urls.baseUrl), headers: {
      'Content-Type': 'application/json',
    });
    
    if (response.statusCode == 200) {
      try {
        final groceries = json.decode(response.body)["data"];
        // print(groceries);

        List<GroceryModel> groceryList = (groceries as List)
            .map<GroceryModel>((grocery) => GroceryModel.fromJson(grocery))
            .toList();

        return groceryList;
      } catch (e) {
        // print("here and there");
        // print(e);
        throw ServerException(message: 'Failed to load groceries');
      }
    } else {
      throw ServerException(message: 'Failed to load groceries');
    }
  }

  @override
  Future<GroceryModel> getGrocery(String id) async {
    final response =
        await client.get(Uri.parse(Urls.getGroceryUrl(id)), headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      final grocery = json.decode(response.body)["data"];
      return GroceryModel.fromJson(grocery);
    } else {
      throw ServerException(message: 'Failed to load grocery');
    }
  }
}
