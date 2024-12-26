import 'package:elevate_task/core/Network/Api_Service/ApiResult.dart';
import 'package:elevate_task/core/Network/Api_Service/Api_constant.dart';
import 'package:elevate_task/core/Network/Api_Service/apiConsumer.dart';
import 'package:elevate_task/features/Home/Data/Models/productResponse.dart';
import 'package:elevate_task/features/Home/Data/Repository/ProductRepository.dart';

class ProductRepositoryImpl implements ProductRepository {
  ApiConsumer apiConsumer;

  ProductRepositoryImpl(this.apiConsumer);

  @override
  Future<ApiResult<List<ProductResponse>>> getProduct() async {
    try {
      var data = await apiConsumer.get(ApiConstants.products);


      List<ProductResponse> products = (data as List)
          .map((item) => ProductResponse.fromJson(item))
          .toList();

      return ApiResult.success(products);
    } catch (e) {
      return ApiResult.error("product error $e");
    }

  }
}
