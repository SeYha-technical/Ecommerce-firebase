import 'package:ecommerce_bloc/domain/categories/entities/cateories_entity.dart';

abstract class CategoriesDisplayState {}

class CategoriesLoading extends CategoriesDisplayState {}

class CategoriesLoaded extends CategoriesDisplayState {
  final List<CategoryEntity> categories;
  CategoriesLoaded({required this.categories});
}

class LoadCategoriesFailure extends CategoriesDisplayState {}
