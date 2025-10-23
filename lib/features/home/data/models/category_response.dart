import 'package:bookia/features/home/domain/entities/category_entity.dart';

class CategoryResponse {
  int? id;
  String? name;
  int? productsCount;

  CategoryResponse({this.id, this.name, this.productsCount});

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    return CategoryResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      productsCount: json['products_count'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'products_count': productsCount,
  };

  CategoryEntity toEntity() =>
      CategoryEntity(id: id ?? 0, name: name ?? '     ');
}
