import 'package:elevate_task/core/Network/Api_Service/ApiResult.dart';
import 'package:elevate_task/features/Home/Data/Models/productResponse.dart';

abstract class ProductRepository{
  Future <ApiResult<List<ProductResponse>>>getProduct();

}