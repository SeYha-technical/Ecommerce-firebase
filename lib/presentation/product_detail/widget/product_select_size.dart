import 'package:ecommerce_bloc/common/helper/buttonsheet/app_buttonsheet.dart';
import 'package:ecommerce_bloc/core/config/theme/app_color.dart';
import 'package:ecommerce_bloc/domain/product/enitites/product.dart';
import 'package:ecommerce_bloc/presentation/product_detail/bloc/product_size_select_cubit.dart';
import 'package:ecommerce_bloc/presentation/product_detail/widget/product_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedSize extends StatelessWidget {
  final ProductEntity productEntity;
  const SelectedSize({required this.productEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBottomSheet.display(
          context,
          BlocProvider.value(
            value: BlocProvider.of<ProductSizeSelectionCubit>(context),
            child: ProductSizes(productEntity: productEntity),
          ),
        );
      },
      child: Container(
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Size',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            Row(
              children: [
                BlocBuilder<ProductSizeSelectionCubit, int>(
                  builder: (context, state) => Text(
                    productEntity.sizes[state],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                const Icon(Icons.keyboard_arrow_down, size: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
