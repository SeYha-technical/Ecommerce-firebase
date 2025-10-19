import 'package:ecommerce_bloc/domain/order/usecases/get_cart.dart';
import 'package:ecommerce_bloc/domain/order/usecases/remove_from_cart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/order/entities/product_order.dart';
import '../../service_locator.dart';
import 'get_cart_product_state.dart';

class CartProductsDisplayCubit extends Cubit<CartProductsDisplayState> {
  CartProductsDisplayCubit() : super(CartProductsLoading());

  void displayCartProducts() async {
    var returnedData = await sl<GetCartUseCase>().call();

    returnedData.fold(
      (error) {
        emit(LoadCartProductsFailure(errorMessage: error));
      },
      (data) {
        emit(CartProductsLoaded(products: data));
      },
    );
  }

  Future<void> removeProduct(ProductOrderedEntity product) async {
    emit(CartProductsLoading());
    var returnedData = await sl<RemoveFromCartUseCase>().call(
      params: product.id,
    );
    returnedData.fold(
      (error) {
        emit(LoadCartProductsFailure(errorMessage: error));
      },
      (data) {
        displayCartProducts();
      },
    );
  }
}
