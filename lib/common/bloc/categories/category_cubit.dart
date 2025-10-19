import 'package:ecommerce_bloc/common/bloc/categories/categoy_state.dart';
import 'package:ecommerce_bloc/domain/categories/usecases/cateogries_usecases.dart';
import 'package:ecommerce_bloc/presentation/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesDisplayCubit extends Cubit<CategoriesDisplayState> {
  CategoriesDisplayCubit() : super(CategoriesLoading());
  void displayCategories() async {
    var returnedData = await sl<CategoryUseCase>().call();
    returnedData.fold(
      (error) {
        emit(LoadCategoriesFailure());
      },
      (data) {
        emit(CategoriesLoaded(categories: data));
      },
    );
  }
}
