import 'package:ecommerce_bloc/common/bloc/button/button_state_cubit.dart';
import 'package:ecommerce_bloc/common/widget/app_bar.dart';
import 'package:ecommerce_bloc/domain/product/enitites/product.dart';
import 'package:ecommerce_bloc/presentation/product_detail/bloc/product_qty_cubit.dart';
import 'package:ecommerce_bloc/presentation/product_detail/bloc/product_size_select_cubit.dart';
import 'package:ecommerce_bloc/presentation/product_detail/bloc/select_color_cubit.dart';
import 'package:ecommerce_bloc/presentation/product_detail/widget/product_image.dart';
import 'package:ecommerce_bloc/presentation/product_detail/widget/product_price.dart';
import 'package:ecommerce_bloc/presentation/product_detail/widget/product_quantity.dart';
import 'package:ecommerce_bloc/presentation/product_detail/widget/product_select_color.dart';
import 'package:ecommerce_bloc/presentation/product_detail/widget/product_select_size.dart';
import 'package:ecommerce_bloc/presentation/product_detail/widget/product_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/add_to_card.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductDetailPage({required this.productEntity, super.key});
  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < productEntity.colors.length; i++) {}

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductQuantityCubit()),
        BlocProvider(create: (context) => ProductColorSelectionCubit()),
        BlocProvider(create: (context) => ProductSizeSelectionCubit()),
        BlocProvider(create: (context) => ButtonStateCubit()),
        //BlocProvider(create: (context) => FavoriteIconCubit()..isFavorite(productEntity.productId))
      ],
      child: Scaffold(
        appBar: BasicAppbar(hideBack: false),
        bottomNavigationBar: AddToBag(productEntity: productEntity),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImages(productEntity: productEntity),
              const SizedBox(height: 10),
              ProductTitle(productEntity: productEntity),
              const SizedBox(height: 10),
              ProductPrice(productEntity: productEntity),
              const SizedBox(height: 20),
              SelectedSize(productEntity: productEntity),
              const SizedBox(height: 15),
              SelectedColor(productEntity: productEntity),
              const SizedBox(height: 15),
              ProductQuantity(productEntity: productEntity),
            ],
          ),
        ),
      ),
    );
  }
}
