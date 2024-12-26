import 'package:bloc/bloc.dart';
import 'package:elevate_task/features/Home/Data/Models/productResponse.dart';
import 'package:elevate_task/features/Home/Data/Repository/ProductRepository.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';
class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productRepository) : super(ProductInitial());
  final ProductRepository productRepository;


  Future<void> loadAllProduct() async {
    emit(ProductLoading());

    try {
      var result = await productRepository.getProduct();

      if (result.isSuccess) {
        List<ProductResponse> products = result.data!;
        emit(ProductSuccess(products));
      } else {
        emit(ProductError(result.error ?? "Unknown error occurred"));
      }
    } catch (e) {
      emit(ProductError("An exception occurred: $e"));
    }
  }
}
