import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_bloc/data/product/model/color.dart';

import '../../../domain/product/enitites/product.dart';

class ProductModel {
  final String categoryId;
  final List<ProductColorModel> colors;
  final Timestamp createdDate;
  final num discountedPrice;
  final int gender;
  final List<String> images;
  final num price;
  final List<String> sizes;
  final String productId;
  final int saleNumber;
  final String title;

  ProductModel({
    required this.categoryId,
    required this.colors,
    required this.createdDate,
    required this.discountedPrice,
    required this.gender,
    required this.images,
    required this.price,
    required this.sizes,
    required this.productId,
    required this.saleNumber,
    required this.title,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      categoryId: map['categoryId'] as String? ?? '',
      colors: map['colors'] != null
          ? List<ProductColorModel>.from(
              map['colors'].map((e) => ProductColorModel.fromMap(e)),
            )
          : [],
      // colors: List<ProductColorModel>.from(
      //   map['colors'].map((e) => ProductColorModel.fromMap(e)),
      // ),
      createdDate: map['createdDate'] as Timestamp? ?? Timestamp.now(),
      discountedPrice: map['discountedPrice'] as num,
      gender: map['gender'] as int,
      images: map['images'] != null
          ? List<String>.from(map['images'].map((e) => e.toString()))
          : [],
      price: (map['price'] as num?) ?? 0,
      sizes: map['sizes'] != null
          ? (map['sizes'] is List
                ? List<String>.from(map['sizes'])
                : (map['sizes'] as Map).values
                      .map((e) => e.toString())
                      .toList())
          : [],
      productId: map['productId'] as String? ?? '',
      saleNumber: (map['saleNumber'] as int?) ?? 0,
      title: map['title'] ?? 'Unknown Product',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryId': categoryId,
      'colors': colors.map((e) => e.toMap()).toList(),
      'createdDate': createdDate,
      'discountedPrice': discountedPrice,
      'gender': gender,
      'images': images.map((e) => e.toString()).toList(),
      'price': price,
      'sizes': sizes.map((e) => e.toString()).toList(),
      'productId': productId,
      'saleNumber': saleNumber,
      'title': title,
    };
  }
}

extension ProductXModel on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      categoryId: categoryId,
      colors: colors.map((e) => e.toEntity()).toList(),
      createdDate: createdDate,
      discountedPrice: discountedPrice,
      gender: gender,
      images: images,
      price: price,
      sizes: sizes,
      productId: productId,
      saleNumber: saleNumber,
      title: title,
    );
  }
}

extension ProductXEntity on ProductEntity {
  ProductModel fromEntity() {
    return ProductModel(
      categoryId: categoryId,
      colors: colors.map((e) => e.fromEntity()).toList(),
      createdDate: createdDate,
      discountedPrice: discountedPrice,
      gender: gender,
      images: images,
      price: price,
      sizes: sizes,
      productId: productId,
      saleNumber: saleNumber,
      title: title,
    );
  }
}
