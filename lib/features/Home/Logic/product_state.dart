part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final List<ProductResponse> products;

  ProductSuccess(this.products);
}

class ProductError extends ProductState {
  final String error;
  ProductError(this.error);
}
