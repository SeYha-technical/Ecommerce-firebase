import 'package:ecommerce_bloc/data/order/models/product_order.dart';

import '../../../domain/order/entities/order.dart';

class OrderModel {
  final List<ProductOrderedModel> products;
  final String createdDate;
  final String shippingAddress;
  final int itemCount;
  final double totalPrice;
  OrderModel({
    required this.products,
    required this.createdDate,
    required this.shippingAddress,
    required this.itemCount,
    required this.totalPrice,
  });
  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      products: map['products'] != null
          ? List<ProductOrderedModel>.from(
              (map['products'] as List).map(
                (e) => ProductOrderedModel.fromMap(e as Map<String, dynamic>),
              ),
            )
          : [],
      createdDate: map['createdDate'] as String? ?? '',
      shippingAddress: map['shippingAddress'] as String? ?? '',
      itemCount: map['itemCount'] as int? ?? 0,
      totalPrice: map['totalPrice'] as double? ?? 0.0,
    );
  }
}

extension OrderXModel on OrderModel {
  OrderEntity toEntity() {
    return OrderEntity(
      products: products.map((e) => e.toEntity()).toList(),
      createdDate: createdDate,
      shippingAddress: shippingAddress,
      itemCount: itemCount,
      totalPrice: totalPrice,
    );
  }
}
