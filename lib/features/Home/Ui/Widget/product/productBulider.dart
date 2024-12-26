
import 'package:elevate_task/features/Home/Logic/product_cubit.dart';
import 'package:elevate_task/features/Home/Ui/Widget/product/productItem.dart';
import 'package:elevate_task/features/Home/Ui/Widget/product/productShimmmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductBuilder extends StatelessWidget {
  const ProductBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
      if (state is ProductLoading) {
        return GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 2.sp,
              crossAxisSpacing: 2.sp,
              childAspectRatio: 0.64.sp,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return ProductShimmerLoading() ;
            });
      }
      if (state is ProductSuccess) {
        return GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.sp,
              crossAxisSpacing: 10.sp,
              childAspectRatio: 2 / 2.7,
            ),
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              return ProductCard(product: state.products[index]) ;
            });
      }
      if(state is ProductError){
        return Text(state.error);
      }
      return Text("No Product");
    });
  }
}