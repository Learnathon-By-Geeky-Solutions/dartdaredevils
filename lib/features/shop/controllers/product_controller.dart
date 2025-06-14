
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/data/repositories.authentication/product/product_repository.dart';
import 'package:grocify/features/shop/models/product_model.dart';
import 'package:grocify/utils/constants/enums.dart';
import 'package:grocify/utils/constants/sizes.dart';
import 'package:grocify/utils/popups/loaders.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      // Show loader while loading Products
      isLoading.value = true;

      // Fetch Products
      final products = await productRepository.getFeaturedProducts();
      // Assign Products
      featuredProducts.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }




  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      // Fetch Products
      final products = await productRepository.getFeaturedProducts();
return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  // Get the Product Price or Price range for variation
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    // If no variations exist, return the simple price or sale price
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      // if you create variation of product the logic is here
      // Calculate the smallest and largest prices among variations
      // for (var variation in product.productVariations!) {
      //   // Determine the price to consider (sale price if available, otherwise regular price)
      //   double priceToConsider =
      //   variation.salePrice > 0.0 ? variation.salePrice : variation.price;
      //   // Update smallest and largest prices
      //   if (priceToConsider < smallestPrice) {
      //     smallestPrice = priceToConsider;
      //   }
      //   if (priceToConsider > largestPrice) {
      //     largestPrice = priceToConsider;
      //   }
      // }
      // If smallest and largest prices are the same, return a single price
      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        // Otherwise, return a price range
        return '$smallestPrice - $largestPrice';
      }
    }
  }

  /// Calculate Discount Percentage
  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  /// Check Product Stock Status
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }


  // Show Image Popup
  void showEnlargedImage(String image) {
    Get.to(
          () => Dialog.fullscreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: TSizes.defaultSpace * 2, horizontal: TSizes.defaultSpace),
              child: Image.network(image),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(onPressed: () => Get.back(), child: const Text('Close')),
              ),
            ),
          ],
        ),
      ),
      fullscreenDialog: true,
    );
  }

}
