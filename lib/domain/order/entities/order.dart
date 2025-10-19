import 'package:ecommerce_bloc/domain/order/entities/product_order.dart';

class OrderEntity {
  final List<ProductOrderedEntity> products;
  final String createdDate;
  final String shippingAddress;
  final int itemCount;
  final double totalPrice;

  OrderEntity({
    required this.products,
    required this.createdDate,
    required this.shippingAddress,
    required this.itemCount,
    required this.totalPrice,
  });
}
