class UpdateInfoRequest {
  String? name;
  String? address;
  String? phone;

  UpdateInfoRequest({this.name, this.address, this.phone});

  factory UpdateInfoRequest.fromJson(Map<String, dynamic> json) {
    return UpdateInfoRequest(
      name: json['name'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    if (name != null && name!.isNotEmpty) 'name': name,
    if (address != null && address!.isNotEmpty) 'address': address,
    if (phone != null && phone!.isNotEmpty) 'phone': phone,
  };
}
