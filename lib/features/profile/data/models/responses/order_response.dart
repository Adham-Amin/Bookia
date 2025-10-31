class OrderResponse {
  int? id;
  String? orderCode;
  String? orderDate;
  String? status;
  String? total;

  OrderResponse({
    this.id,
    this.orderCode,
    this.orderDate,
    this.status,
    this.total,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) => OrderResponse(
    id: json['id'] as int?,
    orderCode: json['order_code'] as String?,
    orderDate: json['order_date'] as String?,
    status: json['status'] as String?,
    total: json['total'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'order_code': orderCode,
    'order_date': orderDate,
    'status': status,
    'total': total,
  };
}
