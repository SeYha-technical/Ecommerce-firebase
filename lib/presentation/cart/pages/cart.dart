import 'package:ecommerce_bloc/common/widget/app_bar.dart';
import 'package:ecommerce_bloc/core/config/assets/app_vectors.dart';
import 'package:ecommerce_bloc/domain/order/entities/product_order.dart';
import 'package:ecommerce_bloc/presentation/cart/bloc/get_cart_product_cubit.dart';
import 'package:ecommerce_bloc/presentation/cart/bloc/get_cart_product_state.dart';
import 'package:ecommerce_bloc/presentation/cart/widget/checkout.dart';
import 'package:ecommerce_bloc/presentation/cart/widget/product_order_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(title: Text('Cart')),
      body: BlocProvider(
        create: (context) => CartProductsDisplayCubit()..displayCartProducts(),
        child: BlocBuilder<CartProductsDisplayCubit, CartProductsDisplayState>(
          builder: (context, state) {
            if (state is CartProductsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CartProductsLoaded) {
              return state.products.isEmpty
                  ? Center(child: _cartIsEmpty())
                  : Stack(
                      children: [
                        _products(state.products),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Checkout(products: state.products),
                        ),
                      ],
                    );
            }
            if (state is LoadCartProductsFailure) {
              return Center(child: Text(state.errorMessage));
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _products(List<ProductOrderedEntity> products) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return ProductOrderedCard(productOrderedEntity: products[index]);
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: products.length,
    );
  }

  Widget _cartIsEmpty() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppVectors.cartBag),
        const SizedBox(height: 20),
        const Text(
          "Cart is empty",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ],
    );
  }
}
