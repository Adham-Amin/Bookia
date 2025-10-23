import 'package:bookia/features/home/domain/entities/slider_entity.dart';

class SliderResponse {
  String? image;

  SliderResponse({this.image});

  factory SliderResponse.fromJson(Map<String, dynamic> json) =>
      SliderResponse(image: json['image'] as String?);

  Map<String, dynamic> toJson() => {'image': image};

  SliderEntity toEntity() => SliderEntity(image: image);
}
