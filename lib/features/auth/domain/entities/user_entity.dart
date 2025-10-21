class UserEntity {
  final num id;
  final String image;
  final String name;
  final String email;

  UserEntity({
    required this.id,
    required this.image,
    required this.name,
    required this.email,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
    id: json['id'],
    image: json['image'],
    name: json['name'],
    email: json['email'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'image': image,
    'name': name,
    'email': email,
  };
}
