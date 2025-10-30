import 'package:bookia/features/auth/domain/entities/user_entity.dart';

class UpdateUserResponse {
  int? id;
  String? name;
  String? email;
  String? address;
  dynamic city;
  String? phone;
  bool? emailVerified;
  String? image;

  UpdateUserResponse({
    this.id,
    this.name,
    this.email,
    this.address,
    this.city,
    this.phone,
    this.emailVerified,
    this.image,
  });

  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) {
    return UpdateUserResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      city: json['city'] as dynamic,
      phone: json['phone'] as String?,
      emailVerified: json['email_verified'] as bool?,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'address': address,
    'city': city,
    'phone': phone,
    'email_verified': emailVerified,
    'image': image,
  };

  UserEntity toEntity() => UserEntity(
    id: id ?? 0,
    image: image ?? '',
    name: name ?? '',
    address: address ?? '',
    phone: phone ?? '',
    email: email ?? '',
  );
}
