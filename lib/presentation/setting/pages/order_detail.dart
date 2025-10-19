import 'package:ecommerce_bloc/common/widget/app_bar.dart';
import 'package:ecommerce_bloc/core/config/theme/app_color.dart';
import 'package:ecommerce_bloc/domain/order/entities/order.dart';
import 'package:ecommerce_bloc/presentation/setting/pages/order_item.dart';
import 'package:flutter/material.dart';

import '../../../common/helper/navigator/app_navigator.dart';

class OrderDetailPage extends StatelessWidget {
  final OrderEntity orderEntity;
  const OrderDetailPage({required this.orderEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(title: Text('Order')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_items(context), const SizedBox(height: 30), _shipping()],
        ),
      ),
    );
  }

  Widget _items(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Order Items',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 15),
        GestureDetector(
          onTap: () {
            AppNavigator.push(
              context,
              OrderItemsPage(products: orderEntity.products),
            );
          },
          child: Container(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.secondBackground,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.receipt_rounded),
                    const SizedBox(width: 20),
                    Text(
                      '${orderEntity.products.length} Items',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const Text(
                  'View All',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _shipping() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Shipping details',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 15),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.secondBackground,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(orderEntity.shippingAddress),
        ),
      ],
    );
  }
}
