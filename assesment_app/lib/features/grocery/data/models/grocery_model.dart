import 'package:equatable/equatable.dart';
import '../../domain/entities/grocery_entity.dart';

class GroceryModel extends GroceryEntity {
  GroceryModel({
    required String id,
    required String title,
    required String description,
    required double price,
    required String imageUrl,
    required double rating,
    required double discount,
    List<OptionsEntity>? options,
  }) : super(
          id: id,
          title: title,
          description: description,
          price: price,
          imageUrl: imageUrl,
          rating: rating,
          discount: discount,
          options: options,
        );

  factory GroceryModel.fromJson(Map<String, dynamic> json) {
    return GroceryModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      imageUrl: json['imageUrl'] ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      discount: (json['discount'] as num?)?.toDouble() ?? 0.0,
      options: (json['options'] as List<dynamic>?)
          ?.map((option) => OptionsModel.fromJson(option))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'rating': rating,
      'discount': discount,
      'options': options?.map((option) => (option as OptionsModel).toJson()).toList(),
    };
  }
}

class OptionsModel extends OptionsEntity {
  OptionsModel({
    required String id,
    required String name,
    required double price,
  }) : super(
          id: id,
          name: name,
          price: price,
        );

  factory OptionsModel.fromJson(Map<String, dynamic> json) {
    return OptionsModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }
}
