import 'package:ecommerce_bloc/domain/product/usecases/search_by_title.dart';
import 'package:ecommerce_bloc/presentation/serach/widget/search_text_field.dart';
import 'package:ecommerce_bloc/presentation/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../common/widget/app_bar.dart';
import '../../../common/widget/product/product_card.dart';
import '../../../core/config/assets/app_vectors.dart';
import '../../../domain/product/enitites/product.dart';
import '../../Home/bloc/get_product_cubit.dart';
import '../../Home/bloc/get_product_state.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsDisplayCubit(useCase: sl<SearchByTitleUseCase>()),
      child: Scaffold(
        appBar: BasicAppbar(height: 80, title: SearchData()),
        body: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ProductsLoaded) {
              return state.products.isEmpty
                  ? _notFound()
                  : _products(state.products);
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _notFound() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppVectors.notFound),
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            "Sorry, we couldn't find any matching result for your Search.",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
        ),
      ],
    );
  }

  Widget _products(List<ProductEntity> products) {
    return GridView.builder(
      itemCount: products.length,
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ProductCard(productEntity: products[index]);
      },
    );
  }
}
