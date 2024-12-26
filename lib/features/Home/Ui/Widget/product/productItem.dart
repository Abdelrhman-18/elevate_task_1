import 'package:elevate_task/features/Home/Data/Models/productResponse.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  final ProductResponse product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 191.w,
      height: 237.h,
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _buildProductImage()),
          Padding(
            padding: EdgeInsets.all(8.sp),
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildProductTitle(context),
                  SizedBox(height: 2.h),
                  _buildProductDescription(context),
                  SizedBox(height: 2.h),
                  _buildProductPrice(),
                  SizedBox(height: 2.h),
                  _buildReviewSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductImage() {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
      child: Stack(
        children: [
          Image.network(
            product.image ?? "",
            height: 128.h,
            width: 191.w,
            fit: BoxFit.contain,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(child: CircularProgressIndicator());
            },
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.error, size: 40.sp),
          ),
          Container(
            height: 128.h,
            width: 191.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 30.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductTitle(BuildContext context) {
    return Text(
      product.title ?? "no title",
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
            fontSize: 15.sp,
            color: Colors.black87,
          ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildProductDescription(BuildContext context) {
    return Text(
      product.description ?? "no title",
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
            fontSize: 12.sp,
            color: Colors.black87,
          ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildProductPrice() {
    return Text(
      'EGP ${product.price} ',
      style: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildReviewSection() {
    if (product.rating?.rate != null) {
      return Row(
        children: [
          Text(
            "Review (${product.rating!.rate!.toString()})",
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 4.w),
          Icon(Icons.star, color: Colors.orangeAccent, size: 18.sp),
          SizedBox(width: 6.w),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_circle,
              size: 30,
              color: Color(0xFF004087),
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Icon(Icons.star_border, color: Colors.grey, size: 18.sp),
          SizedBox(width: 4.w),
          Text(
            "No rating available",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
          ),
        ],
      );
    }
  }
}
