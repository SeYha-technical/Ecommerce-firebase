import 'package:ecommerce_bloc/presentation/Home/bloc/get_product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/usecases/usecases.dart';

class ProductsDisplayCubit extends Cubit<ProductsDisplayState> {
  final UseCase useCase;
  ProductsDisplayCubit({required this.useCase}) : super(ProductsInitialState());
  void displayProducts({dynamic params}) async {
    emit(ProductsLoading());
    var returnedData = await useCase.call(params: params);
    returnedData.fold(
      (error) {
        emit(LoadProductsFailure());
      },
      (data) {
        emit(ProductsLoaded(products: data));
      },
    );
  }

  void displayInitial() {
    emit(ProductsInitialState());
  }
}
