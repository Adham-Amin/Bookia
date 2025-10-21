import 'package:bookia/features/auth/domain/entities/user_entity.dart';

import 'user.dart';

class AuthResponse {
  User? user;
  String? token;

  AuthResponse({this.user, this.token});

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    token: json['token'] as String?,
  );

  Map<String, dynamic> toJson() => {'user': user?.toJson(), 'token': token};

  UserEntity toEntity() => UserEntity(
    id: user?.id ?? 0,
    image: user?.image ?? '',
    name: user?.name ?? '',
    email: user?.email ?? '',
  );
}
